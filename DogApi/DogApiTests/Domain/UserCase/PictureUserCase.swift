
import XCTest
@testable import DogApi

class PictureUserCaseTests: XCTestCase {
    
    
    var sut : GetPicturesUseCase!
    var dogrepository: DogApiRepositoryMock!
    
    override func setUp(){
        super.setUp()
        
        dogrepository = DogApiRepositoryMock()
        sut = GetPicturesUseCase(dogRepository: dogrepository)
    }
    //
    override func tearDown(){
        super.tearDown()
        
        sut = nil
        dogrepository = nil
    }
    
    func testGetBreedUseCase() {
        let expectation = expectation(description: "TestSuccess")
        
        sut.execute(breed: "akita") {list, error in
            XCTAssertNotNil(list)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testFailGetBreedUseCase (){
        dogrepository.shouldFaile = true
        let expectation = expectation(description: "TestFailure")
        
        sut.execute(breed: "akds"){list, error in
            XCTAssertNil(list)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    
}
