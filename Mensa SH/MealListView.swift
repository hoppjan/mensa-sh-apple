import SwiftUI

struct MealListView: View {
    @State var meals: [Meal] = []

    var body: some View {
        ForEach(meals) { meal in
            MealView(meal: meal)
        }
    }
}
