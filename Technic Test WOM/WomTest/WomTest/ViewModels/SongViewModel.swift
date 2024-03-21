import Foundation

class SongViewModel: ObservableObject {
    @Published var songs: [Song] = []
    
    init(){
        loadData(for: ["us","cl","se"])
    }
    
    func loadData(for countries: [String]) {
        let group = DispatchGroup()
        for country in countries {
            guard let url = URL(string: "https://itunes.apple.com/\(country)/rss/topsongs/limit=10/json") else {
                print("Invalid URL")
                continue
            }
            group.enter()
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                defer{
                    group.leave()
                }
                
                if let error = error{
                    print("Error fetching the data: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode)else{
                    print("Unexpected response: \(String(describing: response))")
                    return
                }
                
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(Response.self, from: data)
                        DispatchQueue.main.async {
                            self.songs += response.feed.entry.map{
                                Song(
                                     id: $0.id.attributes.imId,
                                     name: $0.imName.label,
                                     title: $0.title.label,
                                     artist: $0.imArtist.label,
                                     realeseDate: $0.imReleaseDate?.attributes.label ?? "n/a",
                                     image: $0.imImage,
                                     price: $0.imPrice.label
                                )
                            }
                        }
                    } catch let error {
                        print("Error on JSON: \(error)")
                        //print("REsponse data: \(String(data: data, encoding: .utf8) ?? "nil")" )
                    }
                }
            }.resume()
        }
        
        group.notify(queue: .main){
            self.removeDuplicate()
        }
        
    }
    private func removeDuplicate(){
        self.songs = Array(Set(self.songs))
    }
}

