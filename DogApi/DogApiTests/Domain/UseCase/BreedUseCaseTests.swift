

import XCTest
@testable import DogApi

class BreedUseCaseTests: XCTestCase {
    
    
    var sut : GetBreedUseCase!
    var dogrepository: DogApiRepositoryMock!
    
    override func setUp(){
        super.setUp()
        
        dogrepository = DogApiRepositoryMock()
        sut = GetBreedUseCase(dogRepository: dogrepository)
    }
    //
    override func tearDown(){
        super.tearDown()
        
        sut = nil
        dogrepository = nil
    }
    
    func testGetBreedUseCase() {
        let expectation = expectation(description: "TestSuccess")
        
        sut.execute {list, error in
            XCTAssertNotNil(list)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testFailGetBreedUseCase (){
        dogrepository.shouldFail = true
        let expectation = expectation(description: "TestFailure")
        
        sut.execute{list, error in
            XCTAssertNil(list)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    
}
