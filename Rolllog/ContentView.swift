import SwiftUI

struct ContentView: View {
    @Binding var rolls: [Roll]
    @State private var showingAddRoll = false

    @State private var newlyAddedRoll: Roll?
    @State private var navigateToNewRoll = false
    // Two new pieces of state: Which roll was just created, and whether we should currently
    // be pushed onto its detail screen. Kept separate from your normal row taps below.

    var body: some View {
        List {
            ForEach(rolls) { roll in
                NavigationLink {
                    if let index = rolls.firstIndex(where: { $0.id == roll.id }) {
                        RollDetailView(roll: $rolls[index])
                    }
                } label: {
                    ZStack(alignment: .leading) {
                        FilmTheme.gradient(for: roll.filmStock)
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                        VStack(alignment: .leading, spacing: 2) {
                            Text(roll.filmStock)
                                .font(.headline)
                                .foregroundColor(FilmTheme.textColor(for: roll.filmStock))
                            Text("\(roll.camera) · ISO \(roll.iso)")
                                .font(.subheadline)
                                .foregroundColor(FilmTheme.textColor(for: roll.filmStock).opacity(0.8))
                        }
                        .padding()
                    }
                    .frame(height: 72)
                    .listRowInsets(EdgeInsets())
                }
            }
            .onDelete(perform: deleteRolls)
        }
        .background(
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
            // An invisible, second navigation link sitting behind the List (not one of its rows).
            // It has no visible button, instead it's triggered PROGRAMMATICALLY by flipping
            // "navigateToNewRoll" to true right after a roll is saved below.
        )
        .navigationTitle("My Rolls")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showingAddRoll = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddRoll) {
            AddRollView { newRoll in
                rolls.append(newRoll)
                newlyAddedRoll = newRoll
                navigateToNewRoll = true
                // The moment a roll is saved: add it as before, remember which roll it was,
                // then flip the switch that fires the hidden link above.
            }
        }
    }

    private func deleteRolls(at offsets: IndexSet) {
        rolls.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView(rolls: .constant([]))
}
