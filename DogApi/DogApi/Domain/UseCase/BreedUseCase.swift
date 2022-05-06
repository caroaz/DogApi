
import Foundation

struct GetBreedUseCase {
    let dogRepository : DogRepository
    
    init (dogRepository: DogRepository){
        self.dogRepository = dogRepository
        
    }

    func execute(onCompletion: @escaping (BreedsList?, DomainError?) -> Void){
        dogRepository.fetchDogBreeds {(response, error) in
            onCompletion(response, error)
        }
    }
}
