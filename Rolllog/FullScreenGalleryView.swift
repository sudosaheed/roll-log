//
//  FullScreenGalleryView.swift
//  Roll.log
//
//  Created by Saheed Abdul
//
import SwiftUI

struct FullScreenGalleryView: View {
    @Binding var shots: [Shot]
    // Binding to the whole array, this is just viewing, not editing, but a binding is still needed
    // because TabView's selection works by index into this exact array.

    @State var startIndex: Int
    // Which frame to open on, passed in from wherever you tapped in the grid.

    var body: some View {
        TabView(selection: $startIndex) {
            // TabView with a selection binding is what powers the swipe-between-pages behaviour.
            // "$startIndex" means swiping updates this value, and changing this value would also
            // jump the view to that page.

            ForEach(Array(shots.enumerated()), id: \.element.id) { index, shot in
                singleImageView(shot: shot)
                    .tag(index)
                    // ".tag" links each page to a specific index, so TabView knows which page
                    // corresponds to which value of "startIndex".
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        // ".page" gives us the swipeable, one-screen-at-a-time behaviour (like Photos.app).
        // "indexDisplayMode: .never" hides the little dots indicator, since 36 dots would be unusable.

        .background(Color.black)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Frame \(shots[startIndex].frameNumber)")
        // Updates the nav bar title to match whichever frame is currently on screen i.e frame 1, frame 2 etc.

        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        // Allows the nav bar to be readable (light text) against the black background, like a proper photo viewer.
    }

    @ViewBuilder
    // Lets this function return different view types depending on the if/else inside it.
    private func singleImageView(shot: Shot) -> some View {
        VStack(spacing: 0) {
            Spacer()

            if let imageData = shot.imageData,
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    // ".scaledToFit" here (not .scaledToFill like the grid). I wanted the whole image
                    // visible and uncropped now that it's the main focus, basically (portfolio mode)
            } else {
                Image(systemName: "photo")
                    .font(.system(size: 60))
                    .foregroundColor(.white.opacity(0.4))
            }

            Spacer()

            settingsOverlay(shot: shot)
        }
    }

    private func settingsOverlay(shot: Shot) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("FRAME \(shot.frameNumber)")
                .font(.system(.caption, design: .monospaced))
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text(settingsLine(for: shot))
                .font(.system(.footnote, design: .monospaced))
                .foregroundColor(.white.opacity(0.8))

            if !shot.notes.isEmpty {
                Text(shot.notes)
                    .font(.system(.caption2, design: .monospaced))
                    .foregroundColor(.white.opacity(0.6))
                    .lineLimit(2)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.black.opacity(0.85))
        // Slight transparency so it reads as an overlay/plate rather than a solid block.
    }

    private func settingsLine(for shot: Shot) -> String {
        if shot.aperture.isEmpty && shot.shutterSpeed.isEmpty {
            return "Not logged"
        }
        var parts: [String] = []
        if !shot.aperture.isEmpty { parts.append(shot.aperture) }
        if !shot.shutterSpeed.isEmpty { parts.append(shot.shutterSpeed) }
        if !shot.exposureCompensation.isEmpty { parts.append("EV \(shot.exposureCompensation)") }
        return parts.joined(separator: "   ")
    }
}
