
class BreedViewModelToModelMapper: Mapper<[BreedsViewModel], BreedsList>

{
    
    override  func reverseMap(value: BreedsList) -> [BreedsViewModel]{
//        return value.message.map{  BreedsViewModel(name: $0 ) }

        var list = [BreedsViewModel]()
        for breedName in value.message {
            list.append(BreedsViewModel(name: breedName))
          
        }
        return list
    }
    
}
