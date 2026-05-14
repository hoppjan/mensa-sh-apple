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
