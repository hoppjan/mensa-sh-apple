import Foundation

struct ApiResponse: Codable {
    let last_updated: String
    let data: [Meal]
}

extension String {
    func toApiResponse() -> ApiResponse? {
        guard let data = self.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode(ApiResponse.self, from: data)
    }
}

extension ApiResponse {
    func toMensaDays() -> [MensaDay] {
        Dictionary(grouping: self.data) { meal in meal.date }
            .map { date, meals in MensaDay(date: date, meals: meals.unique()) }
    }
}
