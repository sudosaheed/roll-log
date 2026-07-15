import Foundation

struct Shot: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    var frameNumber: Int
    var aperture: String = ""
    var shutterSpeed: String = ""
    var exposureCompensation: String = ""
    var notes: String = ""
    var dateTaken: Date = Date()
    var imageData: Data?
}

struct Roll: Identifiable, Codable, Equatable, Hashable {
    // Added "Hashable" to both structs, this is required for the navigation pattern, which
    // identifies screens by the actual value being shown rather than a fragile on/off switch.
    var id = UUID()
    var filmStock: String
    var iso: Int
    var camera: String
    var dateStarted: Date
    var numberOfFrames: Int = 36
    var shots: [Shot] = []
}
