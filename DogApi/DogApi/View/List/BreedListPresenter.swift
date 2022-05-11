
class BreedListPresenter: BreedListPresenterProtocol {
   
//    inyeccion por propiedad
    private let  breedUseCase : GetBreedUseCase
    weak var  view: BreedListView?
  
//    por constructor
    init (breedUseCase : GetBreedUseCase){
        self.breedUseCase = breedUseCase
   
    }

    func getBreedList() {
        breedUseCase.execute { [weak self] list, error in
            if let list = list {
                let breeds = list.message.map { BreedsViewModel(name: $0)}
//                opcionales en cadena
                self?.view?.display(breeds)
            }
            else {
                self?.view?.displayError()
            }
        }
    }
    }
