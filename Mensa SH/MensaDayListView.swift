import SwiftUI

struct MensaDayListView: View {
    @State var mensaDays: [MensaDay] = []

    var body: some View {
        List(mensaDays, id: \.date) { day in
            Text(day.date)
            MealListView(meals: day.meals)
        }
        .task {
            requestMensaDays(
                locations: [
                    MensaLocation(code: Location.MensaLuebeck.rawValue, name: "Mensa", city: "Lübeck"),
                    MensaLocation(code: Location.CafeteriaLuebeck.rawValue, name: "Cafeteria", city: "Lübeck"),
                    MensaLocation(code: Location.BitsAndBytes.rawValue, name: "Bits + Bytes", city: "Lübeck"),
                ],
                date: Date.now,
                lang: Language.German,
                completion: { apiResponse in
                    self.mensaDays = apiResponse.toMensaDays()
                }
            )
        }
    }
}
