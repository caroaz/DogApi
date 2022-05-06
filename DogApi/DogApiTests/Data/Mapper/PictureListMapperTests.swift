

import XCTest
@testable import DogApi


class PictureListMapperTests: XCTestCase {
    var sut: PictureListToArrayMapper!
    
    
    override func setUp() {
        super.setUp()
        
        sut = PictureListToArrayMapper()
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    func testListMapper (){
        
        let entity = ["african", "akita"]
        
        let expectedModel = PicturesList (message:  entity)
        
        let model = sut.reverseMap(value: entity)
        
        XCTAssertEqual(expectedModel.message, model.message)
    }
    
    
    
}
