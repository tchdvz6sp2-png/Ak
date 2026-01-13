import Foundation

@MainActor
final class InconsistenciesViewModel: ObservableObject {
    @Published var inconsistencies: [Inconsistency] = Inconsistency.samples
    @Published var selectedSeverity: Inconsistency.Severity?

    var filteredItems: [Inconsistency] {
        guard let severity = selectedSeverity else { return inconsistencies }
        return inconsistencies.filter { $0.severity == severity }
    }
}
