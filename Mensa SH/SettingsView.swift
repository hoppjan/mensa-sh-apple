import SwiftUI

private let settingsShowDate = "settings.showDate"
private let settingsShowEmoji = "settings.showEmoji"
private let settingsPriceGroup = "settings.priceGroup"
private let settingsCity = "settings.city"
private let settingsLocations = "settings.locations"
private let settingsDietFilter = "settings.dietFilter"
private let settingsAllergens = "settings.allergens"

struct SettingsView: View {
    @AppStorage(wrappedValue: true, settingsShowDate)
    private var showDate: Bool
    
    @AppStorage(wrappedValue: true, settingsShowEmoji)
    private var showEmoji: Bool

    @AppStorage(wrappedValue: .Students, settingsPriceGroup)
    private var priceGroup: PriceGroup
    
    @AppStorage(wrappedValue: .Lübeck, settingsCity)
    private var city: City
    
    //@AppStorage(wrappedValue: [.MensaLuebeck, .CafeteriaLuebeck, .BitsAndBytes], settingsLocations)
    //private var locations: [Location]

    @AppStorage(wrappedValue: .None, settingsDietFilter)
    private var dietFilter: DietFilter
    
    //@AppStorage(wrappedValue: [], settingsAllergens)
    //private var settingsAllergens: [Allergens]
    
    var body: some View {
        Form {
                Section {
                    Toggle("Datum anzeigen", isOn: $showDate)
                    Toggle("Emoji anzeigen", isOn: $showEmoji)
                } header: {
                    Text("Allgemein")
                }
            
                Section {
                    Picker("Preisgruppe", selection: $priceGroup) {
                        ForEach(PriceGroup.allCases, id: \.self) { priceGroup in
                            Text(priceGroup.rawValue)
                        }
                    }
                    Picker("Stadt", selection: $city) {
                        ForEach(City.allCases, id: \.self) { city in
                            Text(city.rawValue)
                        }
                    }
                    Picker("Ernährungstyp", selection: $dietFilter) {
                        ForEach(DietFilter.allCases, id: \.self) { diet in
                            Text(diet.rawValue)
                        }
                    }
                } header: {
                    Text("Mensaoptionen")
                }
            
        }
        .navigationTitle("Einstellungen")
    }
}
