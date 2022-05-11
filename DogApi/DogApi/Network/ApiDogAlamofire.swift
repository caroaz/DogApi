
import Foundation
import Alamofire

class ApiDogAlamofire: ApiRest {
    private let statusOk = 200...299
    
    func fetchApiData(onCompletion: @escaping ([String]?, APIError?) -> Void) {
        let url = "https://dog.ceo/api/breeds/list"
     
        
        AF.request(url, method: .get).validate(statusCode: statusOk).responseDecodable(of: BreedsList.self) { response in
            if let breedsList = response.value?.message{
                onCompletion(breedsList, nil)
            }else {
                onCompletion(nil,  APIError(errorMessage: "Invalid request"))            }
            
        }
    }
    
    func fetchDataImages(nameBreed: String, onCompletion: @escaping ([String]?, APIError?) -> Void) {
        
        
        
        let url = "https://dog.ceo/api/breed/\(nameBreed)/images"
        
        
        AF.request(url, method: .get).validate(statusCode: statusOk).responseDecodable(of: PicturesList.self) { response in
            if let pictureList = response.value?.message{
                onCompletion(pictureList, nil)
            }else {
                onCompletion(nil,  APIError(errorMessage: "Invalid request"))            }
            
        }
    }
    
}
