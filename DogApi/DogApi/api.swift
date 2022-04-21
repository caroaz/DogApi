
import Foundation
final class miApi {
    
    static let shared = miApi()
    //    func que obtenga los datos de la api()
    func fetchData(onCompletion: @escaping ( [String]?, APIError?) -> Void) {
        let url = URL(string: "https://dog.ceo/api/breeds/list")!
        
        //        hacer un task (tarea) para guardar datos
        let task = URLSession.shared.dataTask(with: url){
            //            cuando tenga los datos los almacenara en la variable data,el error en variable error y si hay un codigo de respuesta en response
            (data, response, error ) in
            guard let data = data else {
                onCompletion(nil, APIError(message: "Invalid model"))
                return}
            // ejecutara el codigo en esta sección y retornara error si no se puede decodoficar
            guard  let dogList = try? JSONDecoder().decode(Dog.self, from: data) else {
                onCompletion(nil, APIError(message: "Invalid request"))
                return
            }// con self indica que es un tipo de objeto, no es algo que estoy creando
            
            onCompletion(dogList.message, nil)
            
            
        }
        task.resume()
    }
}




struct APIError {
    let message: String
}

