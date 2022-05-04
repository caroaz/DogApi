
import Foundation
struct GetPicturesUseCase {
    let dogRepository : DogRepository
    
    init (dogRepository: DogRepository){
        self.dogRepository = dogRepository
        
    }

    func execute(breed: String, onCompletion: @escaping (PicturesList?, DomainError?) -> Void) {

        dogRepository.fetchDogImages(nameBreed: breed) { pictures, error in

                onCompletion(pictures, error)

            }

        }
}
