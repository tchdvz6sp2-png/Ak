import Foundation

struct Recording: Identifiable, Hashable {
    let id: UUID
    var title: String
    var fileURL: URL
    var createdAt: Date
    var duration: TimeInterval
    var participants: [Speaker]
    var transcript: [TranscriptSegment]
    var tags: [String]
    var caseId: UUID

    static func sample(caseId: UUID) -> Recording {
        Recording(
            id: UUID(),
            title: "Rozhovor s klientem",
            fileURL: URL(fileURLWithPath: "/local/recordings/sample.m4a"),
            createdAt: Date(),
            duration: 642,
            participants: Speaker.samples,
            transcript: TranscriptSegment.samples,
            tags: ["alibi", "schůzka"],
            caseId: caseId
        )
    }
}
