
import Foundation


class DogCeoServiceLocator {
    
    
        private let restApi = ApiDogAlamofire()
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
    
    var getBreedsViewModelToBreedsListMapper: BreedViewModelToModelMapper {
            return BreedViewModelToModelMapper()
        }
        
        var getPicturesViewModelToPicturesListMapper: ImageViewModelToModelMapper {
            return ImageViewModelToModelMapper()
        }
}
