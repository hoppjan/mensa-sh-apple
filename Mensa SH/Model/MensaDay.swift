import Foundation

struct MensaDay: Codable {
    let date: String
    let meals: [Meal]
}

extension MensaDay {
    func toJson() -> String? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return String(data: data, encoding: .utf8)
    }

    static func fromJsonOrNull(json: String?) -> MensaDay? {
        guard let data = json?.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode(MensaDay.self, from: data)
    }

    static func fromDataOrNull(_ data: Data?) -> MensaDay? {
        guard data != nil else { return nil }
        return try? JSONDecoder().decode(MensaDay.self, from: data!)
    }

    var localDate: Date? {
        return ISO8601DateFormatter().date(from: self.date)
    }
}

extension Sequence where Iterator.Element == MensaDay {
    func filterByDate(date: String) -> Iterator.Element {
        return self.first { mensaDay in mensaDay.date == date } ?? MensaDay(date: date, meals: [])
    }
}
