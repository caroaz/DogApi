protocol DogRepository {
    func fetchDogBreeds(onCompletion: @escaping (BreedsList?, DomainError?) -> Void)
    func fetchDogImages(nameBreed: String, onCompletion: @escaping (PicturesList?, DomainError?) -> Void)
}
