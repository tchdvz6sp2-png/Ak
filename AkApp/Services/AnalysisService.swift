import Foundation

struct AnalysisSummary {
    var misinformationSignals: [String]
    var psychologicalProfile: [String]
    var contradictions: [Inconsistency]
}

protocol AnalysisService {
    func analyze(recording: Recording) async throws -> AnalysisSummary
}

struct MockAnalysisService: AnalysisService {
    func analyze(recording: Recording) async throws -> AnalysisSummary {
        try await Task.sleep(nanoseconds: 700_000_000)
        return AnalysisSummary(
            misinformationSignals: [
                "Nekonzistence v časové linii.",
                "Vyhýbavá odpověď na přímou otázku."
            ],
            psychologicalProfile: [
                "Vysoká míra opatrnosti.",
                "Emoční špičky během kontroverzních témat."
            ],
            contradictions: Inconsistency.samples
        )
    }
}
