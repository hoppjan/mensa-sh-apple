enum PriceGroup: String, Codable, CaseIterable {
    case Students = "Students"
    case Employees = "Employees"
    case Guests = "Guests"
}

extension PriceGroup: Identifiable {
    var id: String {
        self.rawValue
    }
}

extension PriceGroup: Translatable {
    func translate(_ language: Language) -> String {
        if language.code == Language.German.code {
            return switch self {
            case .Students: "Studierende"
            case .Employees: "Angestellte"
            case .Guests: "Gäste"
            }
        } else {
            return self.rawValue
        }
    }
}
