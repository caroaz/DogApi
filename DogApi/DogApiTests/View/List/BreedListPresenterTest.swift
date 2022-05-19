

import XCTest
@testable import DogApi

class BreedListPresenterTest: XCTestCase {
    var sut: BreedListPresenter!
        var breedsListView: BreedListViewMock!
        var dogRepository: DogApiRepositoryMock!
         
        override func setUp() {
            super.setUp()
            let breedsArray = [BreedsViewModel(name: "asdf")]
            breedsListView = BreedListViewMock(dogList: breedsArray)
            dogRepository = DogApiRepositoryMock()
            let getBreedsListUseCase = GetBreedUseCase(dogRepository: dogRepository)
            let breedsMapper = BreedViewModelToModelMapper()
            sut = BreedListPresenter(breedUseCase: getBreedsListUseCase, breedMapper: breedsMapper)
            sut.view = breedsListView
        }
        
        override func tearDown() {
            sut = nil
            breedsListView = nil
            dogRepository = nil
            super.tearDown()
        }
        
        func testGetBreedsListSuccess() {
            sut.getBreedList()
            XCTAssertTrue(breedsListView.displayListCalled)
            XCTAssertFalse(breedsListView.displayErrorCalled)
        }
        
        func testGetBreedsListFailure() {
            dogRepository.shouldFail = true
            sut.getBreedList()
            XCTAssertTrue(breedsListView.displayErrorCalled)
            XCTAssertFalse(breedsListView.displayListCalled)
        }
}
