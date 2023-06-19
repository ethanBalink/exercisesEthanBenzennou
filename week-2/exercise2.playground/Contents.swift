import UIKit
struct Post: Codable {
    let id:Int
    let title: String
    let body: String
}

var postsArr :[Post] = []
fileprivate func getData() {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    // network call
    URLSession.shared.dataTask(with: url){(data,response,error) in
        
        do
        {
            let posts = try JSONDecoder().decode([Post].self, from: data!)// usally not allowed
            postsArr = posts
        }
        catch
        {
            print("there was an error")
        }
    }.resume()
}
getData()

