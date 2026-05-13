import Foundation

struct ApiResponse: Codable {
    let last_updated: String
    let data: [Meal]
}

extension Data {
    func toApiResponse() -> ApiResponse {
        let decodedResponse = try? JSONDecoder().decode(ApiResponse.self, from: self)
        return decodedResponse ?? ApiResponse(last_updated: Date.now.ISO8601Format(), data: [])
    }
}

extension ApiResponse {
    func toMensaDays() -> [MensaDay] {
        Dictionary(grouping: self.data) { meal in meal.date }
            .map { date, meals in MensaDay(date: date, meals: meals.unique()) }
    }
}
