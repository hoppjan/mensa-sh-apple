import SwiftUI

struct MealView: View {
    @State var meal: Meal

    @AppStorage(wrappedValue: true, MensaSettings.showEmoji)
    private var showEmoji: Bool

    @AppStorage(wrappedValue: .Students, MensaSettings.priceGroup)
    private var priceGroup: PriceGroup

    var body: some View {
        VStack(alignment: .leading) {
            Text(showEmoji ? "\(meal.emoji) \(meal.name)" : meal.name)
                .bold()
            
            if let price = meal.price.getFor(group: priceGroup).formatPrice() {
                Text(price)
            }
        }
    }
}
