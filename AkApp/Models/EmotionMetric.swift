import Foundation

struct EmotionMetric: Hashable, Codable {
    var neutrality: Double
    var anger: Double
    var fear: Double
    var joy: Double

    static let samples: [EmotionMetric] = [
        EmotionMetric(neutrality: 0.62, anger: 0.08, fear: 0.12, joy: 0.18)
    ]
}
