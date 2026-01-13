import Foundation

struct Inconsistency: Identifiable, Hashable, Codable {
    let id: UUID
    var title: String
    var severity: Severity
    var evidence: String
    var relatedRecordingId: UUID
    var createdAt: Date

    enum Severity: String, CaseIterable, Codable {
        case low = "Nízká"
        case medium = "Střední"
        case high = "Vysoká"
        case critical = "Kritická"
    }

    static let samples: [Inconsistency] = [
        Inconsistency(
            id: UUID(),
            title: "Nesoulad v čase odchodu",
            severity: .high,
            evidence: "V 1. nahrávce tvrdí 20:00, ve 2. nahrávce 21:30.",
            relatedRecordingId: UUID(),
            createdAt: Date()
        )
    ]
}
