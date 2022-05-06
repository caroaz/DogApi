
import Foundation
class CallApiDog: ApiRest {
    
    private let urlSession : URLSession
    init (session: URLSession = URLSession.shared){
        urlSession = session
    }
    
    func fetchApiData(onCompletion: @escaping ( [String]?, APIError?) -> Void) {
        let url = URL(string: "https://dog.ceo/api/breeds/list")!
        
        let task = urlSession.dataTask(with: url){
            
            (data, response, error ) in
            guard let data = data else {
                onCompletion(nil, APIError(errorMessage: "Invalid model"))
                return}
            
            guard  let breedsList = try? JSONDecoder().decode(BreedsList.self, from: data) else {
                onCompletion(nil, APIError(errorMessage: "Invalid request"))
                return
            }
            
            onCompletion(breedsList.message, nil)
            
            
        }
        task.resume()
    }
    
    func fetchDataImages(nameBreed: String, onCompletion: @escaping ( [String]?, APIError?) -> Void) {
        let url = URL(string: "https://dog.ceo/api/breed/\(nameBreed)/images")!
        
        
        let task = urlSession.dataTask(with: url){
            
            (data, response, error ) in
            guard let data = data else {
                onCompletion(nil, APIError(errorMessage: "Invalid model"))
                return}
            
            guard  let picturesList = try? JSONDecoder().decode(PicturesList.self, from: data) else {
                onCompletion(nil, APIError(errorMessage: "Invalid request"))
                return
            }
            
            onCompletion(picturesList.message, nil)
            
        }
        task.resume()
    }
    
}




