

import XCTest
@testable import DogApi

class BreedListPresenterTest: XCTestCase {
    var sut : BreedListPresenter!
    var dogrepository: DogApiRepositoryMock!
    var breedUsecase: GetBreedUseCase!
    var viewMock : BreedListMock!
    
//    var useCase: UseCaseMock!
    
    override func setUp() {
        super.setUp()
        
        dogrepository = DogApiRepositoryMock()
        
    viewMock = BreedListMock()
        breedUsecase = GetBreedUseCase(dogRepository: dogrepository)
        let mapper = BreedViewModelToModelMapper()
       sut = BreedListPresenter(breedUseCase: breedUsecase, breedMapper: mapper)
        sut.view = viewMock
    }

    override func tearDown()  {
        super.tearDown()
       sut = nil
        dogrepository = nil
    }

    func testSuccessGetBreedList() {
        
        
        
        sut.getBreedList()
        XCTAssertTrue(viewMock.displayCalled)
        XCTAssertFalse(viewMock.displayCalledError)
        }

    

    func testFailGetBreedList(){
        dogrepository.shouldFail = true
        sut.getBreedList()
        XCTAssertTrue(viewMock.displayCalledError)
        XCTAssertFalse(viewMock.displayCalled)
        
    }
}
