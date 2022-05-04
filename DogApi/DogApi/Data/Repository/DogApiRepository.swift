class DogApiRepository: DogRepository {
    
    private let restApi: ApiRest
    private let breedMapper : Mapper<BreedsList, [String] >
    //    private let imageMapper : Mapper<PicturesList, [String]>?
    
    init(restApi: ApiRest, mapper :  Mapper<BreedsList, [String] >) {
        self.restApi = restApi
        self.breedMapper = mapper
    }
    
    func fetchDogBreeds(onCompletion: @escaping (BreedsList?, DomainError?) -> Void) {
        restApi.fetchApiData { breeds, error in
            if let breeds = breeds {
                let list = self.breedMapper.reverseMap(value: breeds)
                onCompletion(list, nil)
            } else {
                let domainError = DomainError(description: error?.errorMessage ?? "Error Generico")
                onCompletion(nil, domainError)
            }
        }
    }
    func fetchDogImages(nameBreed: String, onCompletion: @escaping (PicturesList?, DomainError?) -> Void) {
        restApi.fetchDataImages(nameBreed: nameBreed){ breeds, error in
            if let breeds = breeds {
                let list = PicturesList(message: breeds)
                onCompletion(list, nil)
            } else {
                let domainError = DomainError(description: error?.errorMessage ?? "Error Generico")
                onCompletion(nil, domainError)
            }
        }
    }
    
}




