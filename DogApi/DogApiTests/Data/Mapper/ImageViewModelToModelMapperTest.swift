
import XCTest
@testable import DogApi

class ImageViewModelToModelMapperTest: XCTestCase {

    var sut: ImageViewModelToModelMapper!
    
    
    override func setUp() {
        super.setUp()
        
        sut = ImageViewModelToModelMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
        
        
    }
    
    func testListMapper (){
        
        let entity = PicturesList(message: ["akita", "beagle"])
        
        let expectedModel = entity.message.map{   ImageViewModel(name: $0 ) }
//
        let model = sut.reverseMap(value: entity)
//
      
        XCTAssertEqual(expectedModel[0].name, model[0].name)
        XCTAssertEqual(expectedModel[1].name, model[1].name)
    }
}
