enum City: String, Codable, CaseIterable {
    case Flensburg = "Flensburg"
    case Heide = "Heide"
    case Kiel = "Kiel"
    case Lübeck = "Lübeck"
    case Osterrönfeld = "Osterrönfeld"
    case Wedel = "Wedel"
}

extension City: Identifiable {
    var id: String {
        self.rawValue
    }
}
