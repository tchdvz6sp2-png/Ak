import SwiftUI

struct CaseDetailView: View {
    let caseFile: CaseFile

    var body: some View {
        List {
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
                    NavigationLink("Ukázková nahrávka") {
                        RecordingDetailView(recording: Recording.sample(caseId: caseFile.id))
                    }
                } else {
                    ForEach(caseFile.recordings) { recording in
                        NavigationLink(recording.title) {
                            RecordingDetailView(recording: recording)
                        }
                    }
                }
            }
        }
        .navigationTitle(caseFile.title)
    }
}
