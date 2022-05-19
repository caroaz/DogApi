import XCTest
@testable import DogApi

class BreedListDelegateTest: XCTestCase {
    var sut:BreedListDelegate!
        var viewController: BreedsListViewControllerMock!
        var breedsListView: BreedListViewMock!
        
        override func setUp() {
            super.setUp()
            sut = BreedListDelegate()
            let breedsArray = [BreedsViewModel(name: "asdf")]
            breedsListView = BreedListViewMock(dogList: breedsArray)
            let serviceLocator = DogCeoServiceLocator()
            let presenter = BreedListPresenter(breedUseCase: serviceLocator.breedUseCase,
                                               breedMapper: serviceLocator.getBreedsViewModelToBreedsListMapper)
            
        
            viewController = BreedsListViewControllerMock(viewDataSource: BreedListDataSource(), viewDelegate: sut, presenter: presenter)
            presenter.view = breedsListView
            sut.view = breedsListView
            //viewController.viewDidLoad()
        }
   
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func testShowNextViewControllerIsCalled() {
        let tableView = viewController.view.subviews[0] as! UITableView
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(breedsListView.showNextViewControllerCalled)
    }
}
