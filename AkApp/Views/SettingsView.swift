import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()

    var body: some View {
        NavigationStack {
            Form {
                Section("API klíče") {
                    SecureField("AssemblyAI", text: $viewModel.assemblyApiKey)
                    SecureField("OpenAI", text: $viewModel.openAiKey)
                }

                Section("Zpracování") {
                    Toggle("Preferovat offline režim", isOn: $viewModel.useOnDeviceProcessing)
                    Toggle("Biometrické ověření", isOn: $viewModel.enableFaceId)
                }

                Section("Právní upozornění") {
                    Toggle("Zobrazit varování", isOn: $viewModel.showLegalWarning)
                    if viewModel.showLegalWarning {
                        Text("Zkontrolujte legislativu ohledně nahrávání rozhovorů v dané zemi.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Nastavení")
        }
    }
}
