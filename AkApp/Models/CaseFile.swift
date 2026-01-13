import Foundation

struct CaseFile: Identifiable, Hashable {
    let id: UUID
    var title: String
    var summary: String
    var createdAt: Date
    var recordings: [Recording]
    var tags: [String]

    static let sample = CaseFile(
        id: UUID(),
        title: "Případ Orion",
        summary: "První interní analýza rozhovoru.",
        createdAt: Date(),
        recordings: [],
        tags: ["interní", "pilot"]
    )
}
