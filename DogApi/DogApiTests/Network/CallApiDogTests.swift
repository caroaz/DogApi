
import XCTest
@testable import DogApi
import Mimic

class DogApiTests: XCTestCase {
    
    var sut : CallApiDog!
    
    override func setUp() {
        Mimic.start()
        sut = CallApiDog()
        super.setUp()
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
        //        response , responde con un objeto Body con status 200
        let response = response(with: body, status: 200)
        
        Mimic.mimic(request: request, response: response)
        
        //        siempre que se trabaje con async se debe crear expectation o siempre el test funcionará, pero puede que este fallando
        let expectation = expectation(description: "TestSuccess")
        
        //    este test prueba que se devuelve un body no sea nulo y nulo el error No el status
        sut .fetchApiData { list, error in
            XCTAssertNotNil(list)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    //    testear error
    func testIncorrectModelFetchApiData(){
        let request = request(with: .get, url: "https://dog.ceo/api/breeds/list")
        
        let body : [String: Any] = [
            "invalidKey": ["affenpinscher", "african"],
            "status": "success"
        ]
        
        let response = response(with: body, status: 200)
        
        Mimic.mimic(request: request, response: response)
        let expectation = expectation(description: "TestSuccess")
        
        //        este test prueba que el response sea un listado nulo y eror no nulo
        sut .fetchApiData { list, error in
            XCTAssertNil(list)
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.errorMessage, "Invalid request")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    
    func testSuccessFetchDataImages(){
        let request = request(with: .get, url: "https://dog.ceo/api/breed/african/images")
        //        request interrumple el proceso de un get a un endpoint
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
        
        //        este test prueba que el response sea un listado nulo y eror no nulo
        sut .fetchDataImages(nameBreed: "asd" ) { list, error in
            XCTAssertNil(list)
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.errorMessage, "Invalid request")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
}
