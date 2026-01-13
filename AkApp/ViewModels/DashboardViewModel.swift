import Foundation

@MainActor
final class DashboardViewModel: ObservableObject {
    @Published var cases: [CaseFile] = []
    @Published var isLoading = false

    private let store: RecordingStore

    init(store: RecordingStore = LocalRecordingStore()) {
        self.store = store
    }

    func loadCases() async {
        isLoading = true
        cases = await store.fetchCases()
        isLoading = false
    }

    func addCase(title: String) async {
        let newCase = CaseFile(
            id: UUID(),
            title: title,
            summary: "Nový případ vytvořený uživatelem.",
            createdAt: Date(),
            recordings: [],
            tags: []
        )
        await store.addCase(newCase)
        cases = await store.fetchCases()
    }
}
