//
//  GalleryFrameCell.swift
//  Roll.log
//
//  Created by Saheed Abdul
//
import SwiftUI

struct GalleryFrameCell: View {
    let shot: Shot

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack {
                // "ZStack" layers views on top of each other (front to back) it's used here so the app can show
                // either a real image OR a placeholder in the same space.

                if let imageData = shot.imageData,
                   let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        // ".scaledToFill" crops the image to fill the frame neatly, like a proper contact sheet.
                        
                        .frame(height: 140)
                        .clipped()
                        // This cuts off anything spilling outside the frame's edges after scaling.
                } else {
                    Rectangle()
                        .fill(Color(.secondarySystemBackground))
                        .frame(height: 140)
                        .overlay {
                            Image(systemName: "photo")
                                .foregroundColor(.secondary)
                        }
                    // A plain grey placeholder box with a small photo icon, shown when no scan has been added yet.
                }
            }
            .cornerRadius(8)

            Text("Frame \(shot.frameNumber)")
                .font(.system(.caption, design: .monospaced))
                .fontWeight(.bold)
            // my choice of font to give that analog style

            Text(settingsLine)
                .font(.system(.caption2, design: .monospaced))
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
    }

    private var settingsLine: String {
        // A "computed property" instead of storing this as a variable, it's calculated fresh
        // each time it's needed, built from whichever fields actually have values. Still in the works to be able to edit.

        if shot.aperture.isEmpty && shot.shutterSpeed.isEmpty {
            return "Not logged"
        }

        var parts: [String] = []
        if !shot.aperture.isEmpty { parts.append(shot.aperture) }
        if !shot.shutterSpeed.isEmpty { parts.append(shot.shutterSpeed) }
        if !shot.exposureCompensation.isEmpty { parts.append(shot.exposureCompensation) }
        // This will only include settings that have actually been filled in, so half-logged frames
        // don't show a messy "· ·" with gaps.

        return parts.joined(separator: " · ")
        // Joins whatever's in the list with a middle-dot separator, e.g. "f/2.8 · 1/250 · +1"
    }
}
