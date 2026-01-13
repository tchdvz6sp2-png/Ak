import SwiftUI

struct CaseDetailView: View {
    @StateObject private var viewModel: CaseDetailViewModel

    init(caseId: UUID) {
        _viewModel = StateObject(wrappedValue: CaseDetailViewModel(caseId: caseId))
    }

    var body: some View {
        List {
            if let caseFile = viewModel.caseFile {
                Section("Souhrn") {
                    Text(caseFile.summary)
                    Text("Vytvořeno: \(caseFile.createdAt.formatted(date: .abbreviated, time: .shortened))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    if !caseFile.tags.isEmpty {
                        Text("Štítky: \(caseFile.tags.joined(separator: ", "))")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }

                Section("Nahrávky") {
                    if caseFile.recordings.isEmpty {
                        Text("Zatím bez nahrávek.")
                            .foregroundColor(.secondary)
                    }

                    ForEach(caseFile.recordings) { recording in
                        NavigationLink(recording.title) {
                            RecordingDetailView(recording: recording)
                        }
                    }
                }

                Section("Akce") {
                    Button("Přidat ukázkovou nahrávku") {
                        Task { await viewModel.addSampleRecording() }
                    }
                }
            } else if viewModel.isLoading {
                ProgressView("Načítám případ…")
            } else {
                Text("Případ se nepodařilo načíst.")
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle(viewModel.caseFile?.title ?? "Detail případu")
        .task {
            await viewModel.load()
        }
    }
}
