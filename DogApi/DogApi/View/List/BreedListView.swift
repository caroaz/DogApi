//plano de lo que queremos que muestre la lista

protocol BreedListView: AnyObject {
    func display (_ list : [BreedsViewModel])
    func displayError ()
    func showNextVIewController(name: String)
    
    var dogList: [BreedsViewModel] { get set }
}
