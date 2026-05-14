import SwiftUI

struct MealView: View {
    @State var meal: Meal

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(meal.emoji) \(meal.name)")
                .bold()
            
            if let price = meal.price.getFor(group: .Students).formatPrice() {
                Text(price)
            }
        }
    }
}
