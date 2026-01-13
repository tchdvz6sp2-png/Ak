import Foundation

struct TranscriptSegment: Identifiable, Hashable {
    let id: UUID
    var speakerId: UUID
    var text: String
    var startedAt: TimeInterval
    var endedAt: TimeInterval
    var detectedEmotion: EmotionMetric

    static let samples: [TranscriptSegment] = [
        TranscriptSegment(
            id: UUID(),
            speakerId: UUID(),
            text: "Byl jsem doma kolem osmé.",
            startedAt: 12,
            endedAt: 18,
            detectedEmotion: EmotionMetric.samples.first ?? EmotionMetric(neutrality: 0.7, anger: 0.1, fear: 0.05, joy: 0.15)
        )
    ]
}
