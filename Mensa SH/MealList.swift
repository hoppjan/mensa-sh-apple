import SwiftUI

struct MealList: View {
    @State var meals: [Meal] = []

    var body: some View {
        List(meals) { meal in
            MealView(meal: meal)
        }
        .task {
            var dateComponent = DateComponents()
            dateComponent.day = 1
            requestMensaDays(
                locations: [
                    MensaLocation(code: Location.MensaLuebeck.rawValue, name: "Mensa", city: "Lübeck"),
                    MensaLocation(code: Location.CafeteriaLuebeck.rawValue, name: "Cafeteria", city: "Lübeck"),
                    MensaLocation(code: Location.BitsAndBytes.rawValue, name: "Bits + Bytes", city: "Lübeck"),
                ],
                date: Calendar.current.date(byAdding: dateComponent, to: Date.now)!,
                lang: Language.German,
                completion: { apiResponse in
                    guard let day = apiResponse.toMensaDays().first else { return }
                    self.meals = day.meals
                }
            )
        }
    }
}
