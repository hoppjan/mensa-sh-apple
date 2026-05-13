import Foundation

struct GroupedPrices: Codable {
    let students: Float
    let employees: Float
    let guests: Float
}

extension GroupedPrices {
    func getFor(group: PriceGroup) -> Float {
        return switch (group) {
        case .Students: students
        case .Employees: employees
        case .Guests: guests
        }
    }
}

extension Float {
    func formatPrice() -> String? {
        return self != 0 ? self.formatted(.currency(code: "EUR")) : nil
    }
}
