import Foundation

@MainActor
final class CaseDetailViewModel: ObservableObject {
    @Published var caseFile: CaseFile?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let caseId: UUID
    private let store: RecordingStore

    init(caseId: UUID, store: RecordingStore = LocalRecordingStore()) {
        self.caseId = caseId
        self.store = store
    }

    func load() async {
        isLoading = true
        caseFile = await store.fetchCase(id: caseId)
        isLoading = false
    }

    func addSampleRecording() async {
        guard let caseFile else { return }
        let recording = Recording.sample(caseId: caseFile.id)
        await store.addRecording(recording, to: caseFile.id)
        await load()
    }
}
