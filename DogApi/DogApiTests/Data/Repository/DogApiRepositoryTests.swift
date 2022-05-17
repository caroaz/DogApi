
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
        let imageMapper = PictureListToArrayMapper()
        sut = DogApiRepository(restApi: restApi, mapper: mapper, imageMapper: imageMapper)
    }
    
    override func tearDown() {
        sut = nil
        restApi = nil
        super.tearDown()
        
    }
    
    func testSuccessFetchDogBreeds(){
        
        let expectation = expectation(description: "TestSuccess")
        
        sut.fetchDogBreeds{list, error in
            XCTAssertNotNil(list)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testFailureFetchDogBreeds(){
        restApi.shouldFail = true
        let expectation = expectation(description: "TestFailure")
        
        sut.fetchDogBreeds{list, error in
            XCTAssertNil(list)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    func testSuccessFetchDogImages(){
        
        let expectation = expectation(description: "TestSuccess")
        
        sut.fetchDogImages(nameBreed: "asd"){list, error in
            XCTAssertNotNil(list)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testFailureFetchDogImages(){
        restApi.shouldFail = true
        let expectation = expectation(description: "TestSuccess")
        
        sut.fetchDogImages(nameBreed: "asd"){list, error in
            XCTAssertNil(list)
            XCTAssertNotNil(error)
            //            XCTAssertEqual( "", "Error Generico")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
}
