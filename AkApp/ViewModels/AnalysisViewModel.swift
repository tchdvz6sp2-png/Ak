import Foundation

@MainActor
final class AnalysisViewModel: ObservableObject {
    @Published var activeSignals: [String]
    @Published var emotionSummary: [String]

    init(
        activeSignals: [String] = ["Nekonzistentní výpovědi", "Hedge fráze"],
        emotionSummary: [String] = ["Strach: střední", "Zlost: nízká", "Euforie: nízká"]
    ) {
        self.activeSignals = activeSignals
        self.emotionSummary = emotionSummary
    }
}
