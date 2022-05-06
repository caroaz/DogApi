
import Foundation


class DogCeoServiceLocator {
    
        private let restApi = CallApiDog()
        private let breedMapper = BreedListToArrayMapper()
        private let pictureMapper = PictureListToArrayMapper()
        
        private var repository : DogApiRepository{
                return DogApiRepository (restApi: restApi, mapper: breedMapper, imageMapper: pictureMapper)
        }
        var breedUseCase : GetBreedUseCase {
                return GetBreedUseCase(dogRepository: repository)
            
        }
        var pictureUseCase : GetPicturesUseCase {
                return GetPicturesUseCase(dogRepository: repository)
            
        }
}
