import UIKit
import Foundation

var greeting = "Hello, playground"

// MARK: - Properties
var baseURL = URLComponents(string:"https://itunes.apple.com/search")!
baseURL.queryItems = [
    "term" : "I am machine",
    "media" : "music"
].map({URLQueryItem(name: $0.key, value: $0.value)})

// MARK: - Closures
Task {
    let (data, response) = try await URLSession.shared.data(from: baseURL.url!)
    
    if let httpResponse = response as? HTTPURLResponse,
       httpResponse.statusCode == 200,
       let string = String(data: data, encoding: .utf8) {
        print(string)
    }
}

// MARK: - Extensions
extension Data {
    func prettyPrintedJSONString() {
        guard
            let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
            let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
            let prettyJSONString = String(data: jsonData, encoding: .utf8) else {
            print("Failed to read JSON object")
            return
        }
        print(prettyJSONString)
    }
}


