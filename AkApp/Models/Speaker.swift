import Foundation

struct Speaker: Identifiable, Hashable {
    let id: UUID
    var name: String
    var voiceprintHash: String
    var reliabilityScore: Double
    var emotionProfile: [EmotionMetric]

    static let samples: [Speaker] = [
        Speaker(
            id: UUID(),
            name: "Klient A",
            voiceprintHash: "vp_2a84",
            reliabilityScore: 0.68,
            emotionProfile: EmotionMetric.samples
        ),
        Speaker(
            id: UUID(),
            name: "Klient B",
            voiceprintHash: "vp_7b19",
            reliabilityScore: 0.52,
            emotionProfile: EmotionMetric.samples
        )
    ]
}
