import SwiftUI

struct InconsistenciesView: View {
    @StateObject private var viewModel = InconsistenciesViewModel()

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Picker("Závažnost", selection: $viewModel.selectedSeverity) {
                        Text("Vše").tag(Inconsistency.Severity?.none)
                        ForEach(Inconsistency.Severity.allCases, id: \\.self) { severity in
                            Text(severity.rawValue).tag(Inconsistency.Severity?.some(severity))
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("Nesrovnalosti") {
                    ForEach(viewModel.filteredItems) { item in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.evidence)
                                .font(.subheadline)
                            Text("Závažnost: \(item.severity.rawValue)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Nesrovnalosti")
        }
    }
}
