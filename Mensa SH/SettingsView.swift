import SwiftUI

class MensaSettings {
    static let showDate = "settings.showDate"
    static let showEmoji = "settings.showEmoji"
    static let priceGroup = "settings.priceGroup"
    static let city = "settings.city"
    static let locations = "settings.locations"
    static let dietFilter = "settings.dietFilter"
    static let allergens = "settings.allergens"
}

struct SettingsView: View {
    @AppStorage(wrappedValue: true, MensaSettings.showDate)
    private var showDate: Bool
    
    @AppStorage(wrappedValue: true, MensaSettings.showEmoji)
    private var showEmoji: Bool

    @AppStorage(wrappedValue: .Students, MensaSettings.priceGroup)
    private var priceGroup: PriceGroup
    
    @AppStorage(wrappedValue: .Lübeck, MensaSettings.city)
    private var city: City
    
    //@AppStorage(wrappedValue: [.MensaLuebeck, .CafeteriaLuebeck, .BitsAndBytes], Settings.locations)
    //private var locations: [Location]

    @AppStorage(wrappedValue: .None, MensaSettings.dietFilter)
    private var dietFilter: DietFilter
    
    //@AppStorage(wrappedValue: [], Settings.allergens)
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
                        Text(priceGroup.translate(Language.German))
                    }
                }
                Picker("Stadt", selection: $city) {
                    ForEach(City.allCases, id: \.self) { city in
                        Text(city.rawValue)
                    }
                }
                Picker("Ernährungstyp", selection: $dietFilter) {
                    ForEach(DietFilter.allCases, id: \.self) { diet in
                        Text(diet.translate(Language.German))
                    }
                }
            } header: {
                Text("Mensaoptionen")
            }
        }
        .navigationTitle("Einstellungen")
    }
}
