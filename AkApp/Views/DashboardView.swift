import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()
    @State private var newCaseTitle = ""

    var body: some View {
        NavigationStack {
            List {
                Section("Případy") {
                    ForEach(viewModel.cases) { item in
                        NavigationLink(value: item) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.title)
                                    .font(.headline)
                                Text(item.summary)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text("Nahrávek: \(item.recordings.count)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }

                Section("Rychlé akce") {
                    TextField("Nový název případu", text: $newCaseTitle)
                    Button("Vytvořit nový případ") {
                        Task {
                            let title = newCaseTitle.trimmingCharacters(in: .whitespacesAndNewlines)
                            guard !title.isEmpty else { return }
                            await viewModel.addCase(title: title)
                            newCaseTitle = ""
                        }
                    }
                }
            }
            .navigationTitle("Dashboard")
            .navigationDestination(for: CaseFile.self) { caseFile in
                CaseDetailView(caseFile: caseFile)
            }
            .task {
                await viewModel.loadCases()
            }
        }
    }
}
