import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var title = "Mensa SH"
    @State private var mensaDay: MensaDay? = nil
    @State private var meals: [Meal] = [
        Meal(
            name: "Lecker Essen",
            date: "2026-05-15",
            price: GroupedPrices(students: 2, employees: 0, guests: 0),
            vegan: true,
            vegetarian: true,
            location: MensaLocation(code: "HL_ME", name: "", city: ""),
            allergens: [],
            language: Language.German,
            
        )
    ]

    var body: some View {
        NavigationView {
            List(meals) { meal in
                Text(meal.name)
                    .bold()

                if let price = meal.price.getFor(group: .Students).formatPrice() {
                    Text(price)
                }
            }
            .task {
                var dateComponent = DateComponents()
                dateComponent.day = 1
                requestMensaDays(
                    locations: [
                        MensaLocation(code: Location.BitsAndBytes.rawValue, name: "", city: ""),
                        MensaLocation(code: Location.MensaLuebeck.rawValue, name: "", city: ""),
                    ],
                    date: Calendar.current.date(byAdding: dateComponent, to: Date.now)!,
                    lang: Language.German,
                    completion: { apiResponse in
                        guard let day = apiResponse.toMensaDays().first else { return }
                        self.mensaDay = day
                        self.meals = day.meals
                    }
                )
            }
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
