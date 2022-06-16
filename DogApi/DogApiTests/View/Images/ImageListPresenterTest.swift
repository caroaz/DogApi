import XCTest
@testable import DogApi

class ImagesListPresenterTest: XCTestCase {
    var sut : ImageListPresenter!
    var dogrepository: DogApiRepositoryMock!
    var imagesUseCase: GetPicturesUseCase!
    var viewMock : ImageListMock!
    

    
    override func setUp() {
        super.setUp()
        
        dogrepository = DogApiRepositoryMock()
        
    viewMock = ImageListMock()
        imagesUseCase = GetPicturesUseCase(dogRepository: dogrepository)
        let mapper = ImageViewModelToModelMapper()
        sut = ImageListPresenter(pictureUseCase: imagesUseCase, imageMapper: mapper)
        sut.view = viewMock
    }

    override func tearDown()  {
        super.tearDown()
       sut = nil
        dogrepository = nil
    }

    func testSuccessGetPictureList() {
        
        
        
        sut.getImageList(breed: "african")
        XCTAssertTrue(viewMock.displayCalled)
        XCTAssertFalse(viewMock.displayCalledError)
        }

    

    func testFailGetPictureList(){
        dogrepository.shouldFail = true
        sut.getImageList(breed: "asd")
        XCTAssertTrue(viewMock.displayCalledError)
        XCTAssertFalse(viewMock.displayCalled)
        
    }
}
