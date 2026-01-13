import Foundation

@MainActor
final class SettingsViewModel: ObservableObject {
    @Published var assemblyApiKey = ""
    @Published var openAiKey = ""
    @Published var useOnDeviceProcessing = true
    @Published var enableFaceId = true
    @Published var showLegalWarning = true
}
