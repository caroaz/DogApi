
import Foundation

import Foundation
@testable import DogApi

class ImageListMock: ImageListView {
    var displayCalled = false
    var displayCalledError = false
    
    
    func display(_ list: [ImageViewModel]) {
        displayCalled = true
    }
    

    
    func displayError() {
        displayCalledError = true
    }
    
    
}
