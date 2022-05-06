@testable import DogApi


class ApiRestMock : ApiRest{
    
    var shouldFaile = false
    
    func fetchApiData(onCompletion: @escaping ([String]?, APIError?) -> Void) {
        
        if shouldFaile {
            onCompletion(nil, APIError(errorMessage: ""))
            
        }
        else {
            onCompletion(["Akita"], nil)
            
        }
    }
    
    
    func fetchDataImages(nameBreed: String, onCompletion: @escaping ([String]?, APIError?) -> Void) {
        if shouldFaile {
            onCompletion(nil, APIError(errorMessage: ""))
            
        }
        else {
            onCompletion(["Akita"], nil)
            
        }
        
    }
    
    
}
