import Foundation

protocol TranscriptionService {
    func transcribe(recording: Recording) async throws -> [TranscriptSegment]
}

struct MockTranscriptionService: TranscriptionService {
    func transcribe(recording: Recording) async throws -> [TranscriptSegment] {
        try await Task.sleep(nanoseconds: 600_000_000)
        return TranscriptSegment.samples
    }
}
