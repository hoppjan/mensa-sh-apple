import Foundation

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
    
    var request = URLRequest(url: components.url!)
    request.httpMethod = "GET"

    let session = URLSession.shared.dataTask(
        with: request,
        completionHandler: { data, response, error in
            guard data != nil else { return }
            DispatchQueue.main.async {
                completion(data!.toApiResponse())
            }
        }
    )
    session.resume()
}
