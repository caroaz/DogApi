import XCTest
@testable import DogApi
import Mimic

class DogApiAlamofireTests: XCTestCase {
    
    var sut : ApiDogAlamofire!
    
    override func setUp() {
        super.setUp()
        Mimic.start()
        sut = ApiDogAlamofire()
        
    }
    override func tearDown() {
        Mimic.stopAllMimics()
        sut = nil
        super.tearDown()
    }
    func testSuccessFetchApiData(){
        let request = request(with: .get, url: "https://dog.ceo/api/breeds/list")
        //        request interrumple el proceso de un get a un endpoint
        let body : [String: Any] = [
            "message": ["affenpinscher", "african"],
            "status": "success"
        ]
        
        let response = response(with: body, status: 200)
        
        Mimic.mimic(request: request, response: response)
     
        let expectation = expectation(description: "Test Success Fetch API Data")
   
        sut .fetchApiData { list, error in
            XCTAssertNotNil(list)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    //    testear error
    func testIncorrectFetchApiData(){
        let request = request(with: .get, url: "https://dog.ceo/api/breeds/list")
        
        let body : [String: Any] = [
            "invalidKey": ["affenpinscher", "african"],
            "status": "success"
        ]
        
        let response = response(with: body, status: 200)
        
        Mimic.mimic(request: request, response: response)
        let expectation = expectation(description: "Test Success Incorrect Model")
      
        sut.fetchApiData { list, error in
            XCTAssertNil(list)
//            XCTAssertNotNil(error)
            XCTAssertEqual(error?.errorMessage, "Invalid request")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    
    func testSuccessFetchDataImages(){
        let request = request(with: .get, url: "https://dog.ceo/api/breed/african/images")
        
        let body : [String: Any] = [
            "message": [ "african"],
            "status": "success"
        ]
        
        let response = response(with: body, status: 200)
        
        Mimic.mimic(request: request, response: response)
        let expectation = expectation(description: "TestSuccess")
        
        sut .fetchDataImages(nameBreed: "african" ) { list, error in
            XCTAssertNotNil(list)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    func testIncorrectModelFetchDataImages(){
        let request = request(with: .get, url: "https://dog.ceo/api/breed/african/images")
        
        let body : [String: Any] = [
            "invalidKey": "african",
            "status": "success"
        ]
        
        let response = response(with: body, status: 200)
        
        Mimic.mimic(request: request, response: response)
        let expectation = expectation(description: "TestSuccess")
      
        sut .fetchDataImages(nameBreed: "asd" ) { list, error in
            XCTAssertNil(list)
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.errorMessage, "Invalid request")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
}
