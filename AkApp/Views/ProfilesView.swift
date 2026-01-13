import SwiftUI

struct ProfilesView: View {
    @StateObject private var viewModel = ProfilesViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filteredSpeakers) { speaker in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(speaker.name)
                            .font(.headline)
                        Text("Důvěryhodnost: \(speaker.reliabilityScore, format: .percent)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Profily")
            .searchable(text: $viewModel.searchQuery, prompt: "Hledat osobu")
        }
    }
}
