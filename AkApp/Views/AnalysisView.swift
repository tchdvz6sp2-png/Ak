import SwiftUI

struct AnalysisView: View {
    @StateObject private var viewModel = AnalysisViewModel()

    var body: some View {
        NavigationStack {
            List {
                Section("Detekce dezinformací") {
                    ForEach(viewModel.activeSignals, id: \\.self) { signal in
                        Text("• \(signal)")
                    }
                }

                Section("Emoční přehled") {
                    ForEach(viewModel.emotionSummary, id: \\.self) { item in
                        Text(item)
                    }
                }

                Section("Křížová analýza") {
                    Text("Automatické porovnání faktů mezi nahrávkami.")
                        .foregroundColor(.secondary)
                    Text("Timeline a mapa kontradikcí se zobrazí po dokončení analýz.")
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Analýza")
        }
    }
}
