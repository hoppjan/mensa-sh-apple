import Foundation

enum DietFilter: String, Codable, CaseIterable {
    case None = "None"
    case Vegetarian = "Vegetarian"
    case Vegan = "Vegan"
}

extension DietFilter: Identifiable {
    var id: String {
        self.rawValue
    }
}

extension DietFilter: Translatable {
    func translate(_ language: Language) -> String {
        if language.code == Language.German.code {
            return switch self {
            case .None: "Alle Gerichte"
            case .Vegetarian: "Vegetarisch"
            case .Vegan: self.rawValue
            }
        } else {
            return self.rawValue
        }
    }
}

extension DietFilter {
    func from(name: String) -> DietFilter {
        return DietFilter.allCases.first(where: { df in df.rawValue == name }) ?? DietFilter.None
    }
}
