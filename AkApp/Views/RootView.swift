import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "rectangle.3.group")
                }

            ProfilesView()
                .tabItem {
                    Label("Profily", systemImage: "person.3")
                }

            AnalysisView()
                .tabItem {
                    Label("Analýza", systemImage: "waveform.path.ecg")
                }

            InconsistenciesView()
                .tabItem {
                    Label("Nesrovnalosti", systemImage: "exclamationmark.triangle")
                }

            SettingsView()
                .tabItem {
                    Label("Nastavení", systemImage: "gear")
                }
        }
    }
}
