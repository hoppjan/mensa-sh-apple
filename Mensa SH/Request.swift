import Foundation

func request(urlString: String, completion: @escaping (Data?) -> Void) {
    let url = URL(string: urlString)!

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let session = URLSession.shared.dataTask(with: request) { data, response, error in
        defer {
            DispatchQueue.main.async {
                completion(nil)
            }
        }

        guard error == nil, let data = data else { return }
        completion(data)
    }
    session.resume()
}

func requestMensaDays(locations: [MensaLocation], date: Date, lang: Language, completion: @escaping (ApiResponse) -> Void) {
    let locationsString = locations.map { l in l.code }.joined(separator: ",")

    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    let dateString = formatter.string(from: date)
    
    var components = URLComponents()
    components.scheme = "https"
    components.host = "speiseplan.mcloud.digital"
    components.path = "/v2/meals"
    components.queryItems = [
        URLQueryItem(name: "location", value: locationsString),
        URLQueryItem(name: "date", value: dateString),
        URLQueryItem(name: "lang", value: lang.code)
    ]

    request(
        urlString: components.url!.absoluteString,
        completion: { data in
            guard data != nil else { return }
            completion(data!.toApiResponse())
        }
    )
}
