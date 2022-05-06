

import Foundation
@testable import DogApi



class DogApiRepositoryMock : DogRepository {
    
    var shouldFaile = false
    func fetchDogBreeds(onCompletion: @escaping (BreedsList?, DomainError?) -> Void) {
        if shouldFaile {
            onCompletion(nil, DomainError(description:  "Error Generico"))
            
        }
        else {
            onCompletion( BreedsList(message: ["akita"] ), nil)
            
        }
        
    }
    
    func fetchDogImages(nameBreed: String, onCompletion: @escaping (PicturesList?, DomainError?) -> Void) {
        if shouldFaile {
            onCompletion(nil, DomainError(description:  "Error Generico"))
            
        }
        else {
            onCompletion( PicturesList(message: ["akita"] ), nil)
            
        }
        
    }
    

    
}
