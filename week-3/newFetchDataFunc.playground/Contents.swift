import UIKit

var token: String = ""
func register(fname:String, lname:String, username:String, pwd: String) {
    let url = URL(string: "https://balink.onlink.dev/register")!
    let userCred: [String: Any] = ["firstname": fname,
                                   "lastname": lname,
                                   "username": username,
                                   "password": pwd]

    let ConvertedToJson = try? JSONSerialization.data(withJSONObject: userCred)

    // create post request
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    // insert json data to the request
    request.httpBody = ConvertedToJson
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    URLSession.shared.dataTask(with: request) { data, response, error in

        if let data = data {
            token = String(data: data, encoding: .utf8) ?? ""
        }
        else
        {
            print("there was an error")
        }
    }.resume()
}
register(fname: <#String#>, lname: <#String#>, username: <#String#>, pwd: <#String#>)





 //new  get func
struct Product: Codable {
    let id: Int
    let title: String
    let description: String
    let  price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: URL
    let images: [URL]
}
let tokenA = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImpkamRAZ2cuY28iLCJwYXNzd29yZCI6ImViMTEiLCJpYXQiOjE2ODc0MTY4MDJ9.kuJAu2n6ujQVboRzf9xiTyM0x-hsWB3snYKvElwx6M4"
var productArr :[Product] = []
fileprivate func newGetData() {
    let url = URL(string: "https://balink.onlink.dev/products")!
    // create get request
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    // insert json data to the request
    request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
    // network call
    URLSession.shared.dataTask(with: request){(data,response,error) in

        do
        {
            if let data = data {
                let products = try JSONDecoder().decode([Product].self, from: data)
                productArr = products
            }
        }
        catch
        {
            print("there was an error")
        }
    }.resume()
}
newGetData()
