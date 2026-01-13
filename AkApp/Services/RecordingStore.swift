import Foundation

protocol RecordingStore {
    func fetchCases() async -> [CaseFile]
    func fetchCase(id: UUID) async -> CaseFile?
    func addCase(_ caseFile: CaseFile) async
    func addRecording(_ recording: Recording, to caseId: UUID) async
    func fetchRecordings(caseId: UUID) async -> [Recording]
}

actor InMemoryRecordingStore: RecordingStore {
    private var cases: [CaseFile] = [CaseFile.sample]

    func fetchCases() async -> [CaseFile] {
        cases
    }

    func fetchCase(id: UUID) async -> CaseFile? {
        cases.first(where: { $0.id == id })
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

actor LocalRecordingStore: RecordingStore {
    private var cases: [CaseFile]
    private let fileURL: URL
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder

    init(fileManager: FileManager = .default) {
        let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        self.fileURL = (documents ?? fileManager.temporaryDirectory)
            .appendingPathComponent("recording_cases.json")
        self.encoder = JSONEncoder()
        self.decoder = JSONDecoder()
        encoder.dateEncodingStrategy = .iso8601
        decoder.dateDecodingStrategy = .iso8601
        self.cases = (try? loadCases()) ?? [CaseFile.sample]
    }

    func fetchCases() async -> [CaseFile] {
        cases
    }

    func fetchCase(id: UUID) async -> CaseFile? {
        cases.first(where: { $0.id == id })
    }

    func addCase(_ caseFile: CaseFile) async {
        cases.append(caseFile)
        persist()
    }

    func addRecording(_ recording: Recording, to caseId: UUID) async {
        guard let index = cases.firstIndex(where: { $0.id == caseId }) else { return }
        cases[index].recordings.append(recording)
        persist()
    }

    func fetchRecordings(caseId: UUID) async -> [Recording] {
        cases.first(where: { $0.id == caseId })?.recordings ?? []
    }

    private func loadCases() throws -> [CaseFile] {
        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            return [CaseFile.sample]
        }
        let data = try Data(contentsOf: fileURL)
        return try decoder.decode([CaseFile].self, from: data)
    }

    private func persist() {
        do {
            let data = try encoder.encode(cases)
            try data.write(to: fileURL, options: [.atomic])
        } catch {
            print("Failed to persist cases: \(error)")
        }
    }
}
