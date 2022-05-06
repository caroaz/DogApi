@testable import DogApi


class ApiRestMock : ApiRest{
    
    var shouldFail = false
    
    func fetchApiData(onCompletion: @escaping ([String]?, APIError?) -> Void) {
        
        if shouldFail {
            onCompletion(nil, APIError(errorMessage: ""))
            
        }
        else {
            onCompletion(["Akita"], nil)
            
        }
    }
    
    
    func fetchDataImages(nameBreed: String, onCompletion: @escaping ([String]?, APIError?) -> Void) {
        if shouldFail {
            onCompletion(nil, APIError(errorMessage: ""))
            
        }
        else {
            onCompletion(["Akita"], nil)
            
        }
        
    }
    
    
}
