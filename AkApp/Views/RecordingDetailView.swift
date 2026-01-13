import SwiftUI

struct RecordingDetailView: View {
    @StateObject private var viewModel: RecordingDetailViewModel

    init(recording: Recording) {
        _viewModel = StateObject(wrappedValue: RecordingDetailViewModel(recording: recording))
    }

    var body: some View {
        List {
            Section("Metadata") {
                Text(viewModel.recording.title)
                    .font(.headline)
                Text("Délka: \(viewModel.recording.duration, format: .number) s")
                Text("Datum: \(viewModel.recording.createdAt.formatted(date: .abbreviated, time: .shortened))")
                Text("Účastníci: \(viewModel.recording.participants.map(\\.name).joined(separator: ", "))")
            }

            Section("Transkript") {
                if viewModel.recording.transcript.isEmpty {
                    Text("Transkript zatím není k dispozici.")
                        .foregroundColor(.secondary)
                }
                ForEach(viewModel.recording.transcript) { segment in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(segment.text)
                            .font(.body)
                        Text("\(segment.startedAt, format: .number)–\(segment.endedAt, format: .number) s")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }

            Section("Analýza") {
                if let summary = viewModel.analysisSummary {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Signály dezinformací")
                            .font(.headline)
                        ForEach(summary.misinformationSignals, id: \\.self) { signal in
                            Text("• \(signal)")
                        }
                        Divider()
                        Text("Psychologický profil")
                            .font(.headline)
                        ForEach(summary.psychologicalProfile, id: \\.self) { item in
                            Text("• \(item)")
                        }
                    }
                } else {
                    Text("Spusťte analýzu pro zobrazení výsledků.")
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("Detail nahrávky")
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button("Transkripce") {
                    Task { await viewModel.transcribe() }
                }
                .disabled(viewModel.isAnalyzing)

                Button("Analýza") {
                    Task { await viewModel.analyze() }
                }
                .disabled(viewModel.isAnalyzing)
            }
        }
        .overlay {
            if viewModel.isAnalyzing {
                ProgressView("Probíhá zpracování…")
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
            }
        }
        .alert("Chyba", isPresented: Binding(
            get: { viewModel.errorMessage != nil },
            set: { _ in viewModel.errorMessage = nil }
        )) {
            Button("OK") {
                viewModel.errorMessage = nil
            }
        } message: {
            Text(viewModel.errorMessage ?? "")
        }
    }
}
