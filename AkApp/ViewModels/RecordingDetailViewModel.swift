import Foundation

@MainActor
final class RecordingDetailViewModel: ObservableObject {
    @Published var recording: Recording
    @Published var analysisSummary: AnalysisSummary?
    @Published var isAnalyzing = false
    @Published var errorMessage: String?

    private let transcriptionService: TranscriptionService
    private let analysisService: AnalysisService

    init(
        recording: Recording,
        transcriptionService: TranscriptionService = MockTranscriptionService(),
        analysisService: AnalysisService = MockAnalysisService()
    ) {
        self.recording = recording
        self.transcriptionService = transcriptionService
        self.analysisService = analysisService
    }

    func transcribe() async {
        isAnalyzing = true
        errorMessage = nil
        do {
            let segments = try await transcriptionService.transcribe(recording: recording)
            recording.transcript = segments
        } catch {
            errorMessage = "Transkripce selhala: \(error.localizedDescription)"
        }
        isAnalyzing = false
    }

    func analyze() async {
        isAnalyzing = true
        errorMessage = nil
        do {
            analysisSummary = try await analysisService.analyze(recording: recording)
        } catch {
            errorMessage = "Analýza selhala: \(error.localizedDescription)"
        }
        isAnalyzing = false
    }
}
