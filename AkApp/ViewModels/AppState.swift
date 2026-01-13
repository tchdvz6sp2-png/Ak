import Foundation
import SwiftUI

@MainActor
final class AppState: ObservableObject {
    @Published var selectedCase: CaseFile?
    @Published var isOfflineModeEnabled = true
    @Published var activeAnalysis: AnalysisJob?
    @Published var lastSyncDate: Date?

    func toggleOfflineMode() {
        isOfflineModeEnabled.toggle()
    }
}
