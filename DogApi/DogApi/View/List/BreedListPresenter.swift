
class BreedListPresenter: BreedListPresenterProtocol {
   
//    inyeccion por propiedad
    private let  breedUseCase : GetBreedUseCase
    private let breedMapper : Mapper<[BreedsViewModel], BreedsList>
    weak var  view: BreedListView?
  
//    por constructor
    init (breedUseCase : GetBreedUseCase, breedMapper : Mapper<[BreedsViewModel], BreedsList>){
        self.breedUseCase = breedUseCase
        self.breedMapper = breedMapper
   
    }

    func getBreedList() {
        breedUseCase.execute { [weak self] list, error in
            if let list = list {
//                let breeds = list.message.map { BreedsViewModel(name: $0)}
                
//                list = BreedsList , Breeds = [BreedsViewModel]
                let breeds = self?.breedMapper.reverseMap(value: list)
                self?.view?.display(breeds ?? [])
            }
            else {
                self?.view?.displayError()
            }
        }
    }
    }
