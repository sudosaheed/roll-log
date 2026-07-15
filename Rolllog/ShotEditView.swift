//
//  ShotEditView.swift
//  Roll.log
//
//  Created by Saheed Abdul
//
import SwiftUI
import PhotosUI

struct ShotEditView: View {
    @Binding var shot: Shot
    var allShots: Binding<[Shot]>
    var index: Int
    @Binding var viewMode: ViewMode
    var filmStock: String

    @Environment(\.dismiss) private var dismiss
    @State private var selectedPhotoItem: PhotosPickerItem?

    var body: some View {
        ZStack {
            FilmTheme.gradient(for: filmStock)
                .opacity(0.35)
                .ignoresSafeArea()

            Form {
                Section("Settings") {
                    TextField("Aperture (e.g. f/2.8)", text: $shot.aperture)
                    TextField("Shutter speed (e.g. 1/250)", text: $shot.shutterSpeed)
                    TextField("Exposure compensation (e.g. +1)", text: $shot.exposureCompensation)
                }
                .listRowBackground(Color.white.opacity(0.6))
                // Rows get a light translucent white rather than fully clear here — text fields
                // need some contrast behind them to look like tappable fields,
                // rather than blending invisibly into the gradient. Could be and interesting look if they were transparent.

                Section("Notes") {
                    TextField("Notes", text: $shot.notes, axis: .vertical)
                }
                .listRowBackground(Color.white.opacity(0.6))

                Section("Scanned image") {
                    if let imageData = shot.imageData,
                       let uiImage = UIImage(data: imageData) {
                        NavigationLink {
                            FullScreenGalleryView(shots: allShots, startIndex: index)
                        } label: {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 250)
                        }
                    }

                    PhotosPicker(selection: $selectedPhotoItem, matching: .images) {
                        Label(shot.imageData == nil ? "Add scanned image" : "Replace image", systemImage: "photo")
                    }

                    if shot.imageData != nil {
                        // Button only shows when there's actually an image to remove.

                        Button(role: .destructive) {
                            shot.imageData = nil
                            // nil is enough, the view above only shows the image block
                            // "if let imageData = shot.imageData", so it disappears automatically,
                            // and the picker label switches back to "Add scanned image".
                        } label: {
                            Label("Remove image", systemImage: "trash")
                        }
                    }
                }
                .listRowBackground(Color.white.opacity(0.6))
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Frame \(shot.frameNumber)")
        .tint(FilmTheme.color(for: filmStock))
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewMode = .gallery
                    dismiss()
                } label: {
                    Image(systemName: "square.grid.2x2")
                }
            }
        }
        .onChange(of: selectedPhotoItem) { _, newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    shot.imageData = data
                }
            }
        }
    }
}
