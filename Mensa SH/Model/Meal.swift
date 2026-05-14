import Foundation

struct Meal: Codable {
    let name: String
    let date: String
    let price: GroupedPrices
    let vegan: Bool
    let vegetarian: Bool
    let location: MensaLocation
    let allergens: [Allergen]
    let language: Language
}

extension Meal: Equatable {
    static func ==(lhs: Meal, rhs: Meal) -> Bool {
        return lhs.name == rhs.name && lhs.date == rhs.date && lhs.location.code == rhs.location.code
    }
}

extension Meal: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
        hasher.combine(self.date)
        hasher.combine(self.location.code)
    }
}

extension Meal: Identifiable {
    var id: String {
        self.date + self.location.code + self.name
    }
}

extension Meal {
    var emoji: String {
        if self.vegan {
            return "🌻"
        } else if self.vegetarian {
            return "🌽"
        } else if allergens.contains(where: { Allergens.Fish == $0.code }) {
            return "🐟"
        } else {
            return "🥩"
        }
    }
}
