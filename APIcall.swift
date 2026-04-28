import Foundation

// Model
struct Joke: Codable {
    let setup: String
    let punchline: String
}

// API Call
let url = URL(string: "https://official-joke-api.appspot.com/random_joke")!

URLSession.shared.dataTask(with: url) { data, response, error in
    
    if let data = data {
        do {
            let joke = try JSONDecoder().decode(Joke.self, from: data)
            
            print("😂 \(joke.setup)")
            print("🤣 \(joke.punchline)")
            
        } catch {
            print("Error decoding data")
        }
    }
    
}.resume()

// Keep program running
RunLoop.main.run()
