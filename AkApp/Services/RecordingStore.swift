import Foundation

protocol RecordingStore {
    func fetchCases() async -> [CaseFile]
    func addCase(_ caseFile: CaseFile) async
    func addRecording(_ recording: Recording, to caseId: UUID) async
    func fetchRecordings(caseId: UUID) async -> [Recording]
}

actor InMemoryRecordingStore: RecordingStore {
    private var cases: [CaseFile] = [CaseFile.sample]

    func fetchCases() async -> [CaseFile] {
        cases
    }

    func addCase(_ caseFile: CaseFile) async {
        cases.append(caseFile)
    }

    func addRecording(_ recording: Recording, to caseId: UUID) async {
        guard let index = cases.firstIndex(where: { $0.id == caseId }) else { return }
        cases[index].recordings.append(recording)
    }

    func fetchRecordings(caseId: UUID) async -> [Recording] {
        cases.first(where: { $0.id == caseId })?.recordings ?? []
    }
}
