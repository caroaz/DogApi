
//solo se puede conformar por clases
protocol ApiRest: AnyObject {
    func fetchApiData(onCompletion: @escaping ( [String]?, APIError?) -> Void)
    func fetchDataImages(nameBreed: String, onCompletion: @escaping ( [String]?, APIError?) -> Void) 
    
}
