import Foundation

protocol AudioCaptureService {
    func startRecording() async throws -> URL
    func stopRecording() async throws -> URL
}

struct MockAudioCaptureService: AudioCaptureService {
    func startRecording() async throws -> URL {
        URL(fileURLWithPath: "/local/recordings/temporary.m4a")
    }

    func stopRecording() async throws -> URL {
        URL(fileURLWithPath: "/local/recordings/final.m4a")
    }
}
