
import Foundation
class CallApiDog: ApiRest {
    
    private let urlSession : URLSession
    init (session: URLSession = URLSession.shared){
        urlSession = session
    }
    //    func que obtenga los datos de la api()
    func fetchApiData(onCompletion: @escaping ( [String]?, APIError?) -> Void) {
        let url = URL(string: "https://dog.ceo/api/breeds/list")!
        
        //        hacer un task (tarea) para guardar datos
        let task = URLSession.shared.dataTask(with: url){
            //            cuando tenga los datos los almacenara en la variable data,el error en variable error y si hay un codigo de respuesta en response
            (data, response, error ) in
            guard let data = data else {
                onCompletion(nil, APIError(errorMessage: "Invalid model"))
                return}
            // ejecutara el codigo en esta sección y retornara error si no se puede decodoficar
            guard  let breedsList = try? JSONDecoder().decode(BreedsList.self, from: data) else {
                onCompletion(nil, APIError(errorMessage: "Invalid model"))
                return
            }// con self indica que es un tipo de objeto, no es algo que estoy creando
            
            onCompletion(breedsList.message, nil)
            
            
        }
        task.resume()
    }
    
    func fetchDataImages(nameBreed: String, onCompletion: @escaping ( [String]?, APIError?) -> Void) {
        let url = URL(string: "https://dog.ceo/api/breed/\(nameBreed)/images")!
        
        //        hacer un task (tarea) para guardar datos
        let task = urlSession.dataTask(with: url){
            //            cuando tenga los datos los almacenara en la variable data,el error en variable error y si hay un codigo de respuesta en response
            (data, response, error ) in
            guard let data = data else {
                onCompletion(nil, APIError(errorMessage: "Invalid model"))
                return}
            // ejecutara el codigo en esta sección y retornara error si no se puede decodoficar
            guard  let picturesList = try? JSONDecoder().decode(PicturesList.self, from: data) else {
                onCompletion(nil, APIError(errorMessage: "Invalid request"))
                return
            }
            
            onCompletion(picturesList.message, nil)
            
            
        }
        task.resume()
    }
    
}




