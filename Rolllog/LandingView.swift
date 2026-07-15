import SwiftUI

struct LandingView: View {
    @State private var rolls: [Roll] = RollStore.load()
    // Loads straight from disk the moment this view exists, so relaunching the app
    // always picks up wherever the rolls list was left last time.
    @State private var showingAddRoll = false

    @State private var newlyAddedRoll: Roll?
    @State private var navigateToNewRoll = false
    // Needed two separate pieces of state here, not just one. The roll itself (so I can
    // find it's index in the array later) and a bool (to actually flip the NavigationLink
    // below open). Neither one alone can do both jobs.

    private var heroImage: UIImage? {
        for roll in rolls.reversed() {
            for shot in roll.shots.reversed() {
                if let data = shot.imageData, let image = UIImage(data: data) {
                    return image
                }
            }
        }
        return nil
    }
    // This feature helps showcase your added photos on the landing view.
    // Both reversed() calls are doing work. I want the most recently taken
    // photo across every roll, not just the first one this happens to stumble on.
    // Reversing rolls starts from the newest roll, reversing shots starts from the
    // newest frame inside it.

    var body: some View {
        ZStack(alignment: .bottom) {
            GeometryReader { geo in
                Group {
                    if let heroImage {
                        Image(uiImage: heroImage)
                            .resizable()
                    } else {
                        Image("LandingPlaceholder")
                            .resizable()
                    }
                }
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
                .clipped()
                // GeometryReader hands me the real screen size to frame against, so this
                // fills the background edge to edge no matter what aspect ratio of the photo.
                // scaledToFill can spill over that frame, so clipped() is
                // there to trim the overflow rather than let it push everything else around.
            }
            .ignoresSafeArea()
            // Extends the photo behind the status bar and home indicator too, instead of
            // boxing it in to just the safe area.

            LinearGradient(
                colors: [.black.opacity(0.55), .clear, .black.opacity(0.8)],
                startPoint: .top, endPoint: .bottom
            )
            .ignoresSafeArea()
            // Dark at the top so "ROLL.LOG" stays legible over a bright photo, clear in
            // the middle so the photo actually gets to show through, dark again at the
            // bottom so the white text sitting over it doesn't wash out against a light shot.

            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Spacer()
                    AlpinoText(text: "ROLL.LOG", size: 15)
                        .tracking(4)
                    Spacer()
                }
                .padding()
                .padding(.top, 8)

                Spacer()

                VStack(alignment: .leading, spacing: 8) {
                    Text("\(rolls.count) roll\(rolls.count == 1 ? "" : "s") logged")
                        .font(.system(.subheadline, design: .serif))
                        .foregroundColor(.white.opacity(0.75))

                    AlpinoText(text: "Roll.Log", size: 40)
                        .foregroundColor(.white)

                    Text("A record of every frame.")
                        .font(.system(.body, design: .serif))
                        .italic()
                        .foregroundColor(.white.opacity(0.85))

                    Divider().background(Color.white.opacity(0.3))
                        .padding(.top, 12)

                    HStack {
                        NavigationLink {
                            ContentView(rolls: $rolls)
                        } label: {
                            Text("My rolls")
                                .font(.system(.subheadline, design: .serif))
                        }

                        Spacer()

                        Button {
                            showingAddRoll = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    .padding(.top, 8)
                }
                .padding()
                .padding(.bottom, 24)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

            NavigationLink(
                destination: Group {
                    if let newlyAddedRoll,
                       let index = rolls.firstIndex(where: { $0.id == newlyAddedRoll.id }) {
                        RollDetailView(roll: $rolls[index])
                    }
                },
                isActive: $navigateToNewRoll
            ) { EmptyView() }
            .hidden()
            // No visible label on purpose. This link just sits parked in the hierarchy
            // doing nothing until navigateToNewRoll flips true. That's how I trigger
            // navigation in code the moment the sheet below finishes adding a roll,
            // rather than waiting on someone to tap something.
        }
        .fontDesign(.serif)
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
        // This is the first screen anyone sees, so there's nowhere to "go back" to anyway,
        // hiding the system nav bar lets my own "ROLL.LOG" title stand in for it instead.
        .onChange(of: rolls) { _, newValue in
            RollStore.save(newValue)
        }
        // Fires on every mutation to rolls, however small, so anything that happens
        // deeper in the app, a new shot logged, a roll deleted still gets written
        // back to disk from up here.
        .sheet(isPresented: $showingAddRoll) {
            AddRollView { newRoll in
                rolls.append(newRoll)
                newlyAddedRoll = newRoll
                navigateToNewRoll = true
                // The order matters a little here, so the roll has to actually be in the
                // array before I flip navigateToNewRoll, since the NavigationLink above
                // looks it up by index and would find nothing otherwise.
            }
        }
    }
}

#Preview {
    LandingView()
}
