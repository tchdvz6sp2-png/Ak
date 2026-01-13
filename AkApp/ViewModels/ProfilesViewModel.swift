import Foundation

@MainActor
final class ProfilesViewModel: ObservableObject {
    @Published var speakers: [Speaker] = Speaker.samples
    @Published var searchQuery = ""

    var filteredSpeakers: [Speaker] {
        guard !searchQuery.isEmpty else { return speakers }
        return speakers.filter { $0.name.localizedCaseInsensitiveContains(searchQuery) }
    }
}
