
//solo se puede conformar por clases
protocol ApiRest: AnyObject {
    func fetchData(onCompletion: @escaping ( [String]?, APIError?) -> Void)
    func fetchDataImages(dataContent: String, onCompletion: @escaping ( [String]?, APIError?) -> Void) 
    
}
