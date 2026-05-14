import SwiftUI

struct ContentView: View {
    @State private var title = "Mensa SH"

    var body: some View {
        NavigationView {
            MealListView()
                .navigationTitle(title)
                #if os(iOS)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                        }
                    }
                }
                #endif
        }
    }
}

#Preview {
    ContentView()
}
