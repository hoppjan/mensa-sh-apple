import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var title = "Mensa SH"

    var body: some View {
        NavigationView {
            MealListView()
                .navigationTitle(title)
        }
    }
}

fileprivate struct NavigationViewWrapper<Content: View>: View {
    let content: () -> Content

    var body: some View {
#if os(macOS)
        NavigationSplitView {
            content()
        } detail: {
            Text("Select an item")
        }
#else
        content()
#endif
    }
}

#Preview {
    ContentView()
}
