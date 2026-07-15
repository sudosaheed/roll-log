//
//  RollStore.swift
//  Roll.log
//
//  Created by Saheed Abdul
//
import Foundation

struct RollStore {
    static let fileURL: URL = {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        // The apps own private sandboxed Documents folder on the device —
        // safe from other apps and preserved between launches.

        return documentsDirectory.appendingPathComponent("rolls.json")
        // Builds the full file path, e.g. .../Documents/rolls.json
    }()

    static func save(_ rolls: [Roll]) {
        do {
            let data = try JSONEncoder().encode(rolls)
            try data.write(to: fileURL)
        } catch {
            print("Failed to save rolls: \(error)")
        }
    }

    static func load() -> [Roll] {
        do {
            let data = try Data(contentsOf: fileURL)
            let rolls = try JSONDecoder().decode([Roll].self, from: data)
            return rolls
        } catch {
            print("No saved rolls found, starting fresh: \(error)")
            return []
        }
    }
}
