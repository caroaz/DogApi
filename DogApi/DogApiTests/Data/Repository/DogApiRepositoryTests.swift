
import XCTest
@testable import DogApi

class DogApiRepositoryTests: XCTestCase {
    var sut : DogApiRepository!
    var restApi : ApiRestMock!
    
    override func setUp(){
        super.setUp()
        
        restApi = ApiRestMock()
//        restApi.shloudFaile = true
        let mapper =  BreedListToArrayMapper()
        sut = DogApiRepository(restApi: restApi, mapper: mapper)
    }
    
    override func tearDown() {
        sut = nil
        restApi = nil
        super.tearDown()
        
    }
    
    func testSuccess(){
        
        let expectation = expectation(description: "TestSuccess")
        
        sut.fetchDogBreeds{list, error in
            XCTAssertNotNil(list)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testFailure(){
        restApi.shouldFaile = true
        let expectation = expectation(description: "TestSuccess")
        
        sut.fetchDogBreeds{list, error in
            XCTAssertNil(list)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
}
