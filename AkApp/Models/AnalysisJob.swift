import Foundation

struct AnalysisJob: Identifiable, Hashable {
    let id: UUID
    var recordingId: UUID
    var progress: Double
    var status: Status
    var startedAt: Date
    var completedAt: Date?

    enum Status: String {
        case queued
        case running
        case finished
        case failed
    }

    static func sample(recordingId: UUID) -> AnalysisJob {
        AnalysisJob(
            id: UUID(),
            recordingId: recordingId,
            progress: 0.4,
            status: .running,
            startedAt: Date(),
            completedAt: nil
        )
    }
}
