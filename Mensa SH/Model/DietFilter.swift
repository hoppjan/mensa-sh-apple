import Foundation

enum DietFilter: String, CaseIterable {
    case None
    case Vegetarian
    case Vegan
}

extension DietFilter {
    func from(name: String) -> DietFilter {
        return DietFilter.allCases.first(where: { df in df.rawValue == name }) ?? DietFilter.None
    }
}
