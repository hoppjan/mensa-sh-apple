class Language: Codable {
    let code: String
    let name: String
    
    init(code: String, name: String) {
        self.code = code
        self.name = name
    }

    static let German = Language(code: "de", name: "Deutsch")
    static let English = Language(code: "en", name: "English")
}
