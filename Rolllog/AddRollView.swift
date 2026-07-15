//
//  AddRollView.swift
//  Roll.log
//
//  Created by Saheed Abdul
//
import SwiftUI

struct AddRollView: View {
    @Environment(\.dismiss) private var dismiss
    var onSave: (Roll) -> Void

    @State private var filmStock = ""
    @State private var iso = ""
    @State private var camera = ""
    @State private var numberOfFrames = "36"
    // New field stored as text since it comes from a text box, converted to Int on save like ISO.

    var body: some View {
        NavigationStack {
            Form {
                TextField("Film stock (e.g. Kodak ColorPlus 200)", text: $filmStock)
                TextField("ISO", text: $iso)
                    .keyboardType(.numberPad)
                TextField("Camera", text: $camera)
                TextField("Number of frames (24 or 36)", text: $numberOfFrames)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("New Roll")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let frameCount = max(1, Int(numberOfFrames) ?? 36)
                        // "max(1, ...)" guarantees this is never 0 or negative, which would otherwise crash
                        // the range below. Safe minimum of 1 frame, no matter what gets typed in.

                        let generatedShots = (1...frameCount).map { frameNum in
                            Shot(frameNumber: frameNum)
                        }
                        // "(1...frameCount)" creates a range, e.g. 1 to 36.
                        // ".map" runs the code inside for every number in that range, turning each one into an empty Shot.
                        // This is what pre-fills your roll with frame slots 1-36 ready to edit.

                        let newRoll = Roll(
                            filmStock: filmStock,
                            iso: Int(iso) ?? 0,
                            camera: camera,
                            dateStarted: Date(),
                            numberOfFrames: frameCount,
                            shots: generatedShots
                        )
                        onSave(newRoll)
                        dismiss()
                    }
                    .disabled(filmStock.isEmpty || camera.isEmpty)
                }
            }
        }
    }
}
