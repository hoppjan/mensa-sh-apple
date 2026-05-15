import SwiftUI

struct ContentView: View {
    @State private var title = "Mensa SH"

    var body: some View {
        #if os(iOS)
        NavigationView {
            MensaDayListView()
                .navigationTitle(title)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                        }
                    }
                }
                
        }
        #else
        MealListView()
        #endif
    }
}

#Preview {
    ContentView()
}
