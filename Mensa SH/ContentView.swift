import SwiftUI

struct ContentView: View {
    @State private var title = "Mensa SH"

    var body: some View {
        NavigationView {
            MealListView()
                .navigationTitle(title)
        }
    }
}

#Preview {
    ContentView()
}
