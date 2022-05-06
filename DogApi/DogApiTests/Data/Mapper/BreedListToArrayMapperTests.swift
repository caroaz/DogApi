

import XCTest
@testable import DogApi

class BreedListToArrayMapperTests: XCTestCase {
    var sut: BreedListToArrayMapper!
    
    
    override func setUp() {
        super.setUp()
        
        sut = BreedListToArrayMapper()
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    func testListMapper (){
        
        let entity = ["african", "akita"]
        
        let expectedModel = BreedsList (message:  entity)
        
        let model = sut.reverseMap(value: entity)
        
        XCTAssertEqual(expectedModel.message, model.message)
    }
    
    
    
}
