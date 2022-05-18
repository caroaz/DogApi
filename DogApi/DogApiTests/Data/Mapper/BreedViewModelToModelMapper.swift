

import XCTest

@testable import DogApi

class BreedViewModelToModelMapperTest: XCTestCase {

    var sut: BreedViewModelToModelMapper!
    
    
    override func setUp() {
        super.setUp()
        
        sut = BreedViewModelToModelMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
        
        
    }
    
    func testListMapper (){
        
        let entity = BreedsList(message: ["akita", "beagle"])
        
        let expectedModel = entity.message.map{  BreedsViewModel(name: $0 ) }
//        
        let model = sut.reverseMap(value: entity)
//
      
        XCTAssertEqual(expectedModel[0].name, model[0].name)
        XCTAssertEqual(expectedModel[1].name, model[1].name)
    }
    
    

}
