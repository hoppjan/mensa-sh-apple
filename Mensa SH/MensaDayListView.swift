import SwiftUI

struct MensaDayListView: View {
    @State var mensaDays: [MensaDay] = []

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 12) {
                ForEach(mensaDays, id: \.date) { day in
                    Section(header: Text(day.date)) {
                        MealListView(meals: day.meals)
                    }
                }
            }
            .padding(20)
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
