//
//  RollDetailView.swift
//  Roll.log
//
//  Created by Saheed Abdul
//
import SwiftUI

enum ViewMode {
    case list
    case gallery
}

struct RollDetailView: View {
    @Binding var roll: Roll
    @State private var viewMode: ViewMode = .list

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack {
            // ZStack layers the gradient behind everything else in this view, filling the
            // entire screen regardless of which mode (list/gallery) is showing on top of it.

            FilmTheme.gradient(for: roll.filmStock)
                .opacity(0.35)
                .ignoresSafeArea()
                // I wanted to extend the gradient all the way to the screen edges, including behind
                // the status bar and nav bar area, rather than stopping at the safe area inset.

            Group {
                if viewMode == .list {
                    listView
                } else {
                    galleryView
                }
            }
        }
        .navigationTitle(roll.filmStock)
        .tint(FilmTheme.color(for: roll.filmStock))
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewMode = (viewMode == .list) ? .gallery : .list
                } label: {
                    Image(systemName: viewMode == .list ? "square.grid.2x2" : "list.bullet")
                }
            }
        }
    }

    private var listView: some View {
        List($roll.shots) { $shot in
            NavigationLink {
                ShotEditView(shot: $shot, allShots: $roll.shots, index: roll.shots.firstIndex(where: { $0.id == shot.id }) ?? 0, viewMode: $viewMode, filmStock: roll.filmStock)
                // List($roll.shots) hands me a bound $shot per row, not an index unlike galleryView's
                // enumerated() below in line (93). Rather than restructure this List just to get one, I look it up by id
                // instead. It's an O(n) scan on every tap, but a roll only ever has 36 frames, so it's not a big deal.
                
            } label: {
                HStack {
                    Text("Frame \(shot.frameNumber)")
                        .font(.headline)
                        .frame(width: 80, alignment: .leading)

                    if shot.aperture.isEmpty && shot.shutterSpeed.isEmpty {
                        Text("Not logged yet")
                            .foregroundColor(.secondary)
                    } else {
                        Text("\(shot.aperture) · \(shot.shutterSpeed)")
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    if shot.imageData != nil {
                        Image(systemName: "photo.fill")
                            .foregroundColor(.accentColor)
                    }
                }
            }
            .listRowBackground(Color.clear)
            // Removes this row's own default white/grey background so our gradient underneath shows through.
        }
        .scrollContentBackground(.hidden)
        // Hides list's own opaque background layer entirely, without this, the gradient
        // behind the list would still be blocked even with rows set to clear.
    }

    private var galleryView: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(Array(roll.shots.enumerated()), id: \.element.id) { index, shot in
                    NavigationLink {
                        FullScreenGalleryView(shots: $roll.shots, startIndex: index)
                    } label: {
                        GalleryFrameCell(shot: shot)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
        .scrollContentBackground(.hidden)
        // ScrollView doesn't usually need this, but it's harmless to include and keeps
        // this screen consistent with listView above.
    }
}
