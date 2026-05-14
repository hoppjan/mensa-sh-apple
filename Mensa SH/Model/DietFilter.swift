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

extension DietFilter {
    func from(name: String) -> DietFilter {
        return DietFilter.allCases.first(where: { df in df.rawValue == name }) ?? DietFilter.None
    }
}
