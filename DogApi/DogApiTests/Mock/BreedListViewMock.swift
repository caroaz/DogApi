
import Foundation
@testable import DogApi

class BreedListMock: BreedListView {
    var displayCalled = false
    var displayCalledError = false
    
    func display(_ list: [BreedsViewModel]) {
     displayCalled = true
    }
    
    func displayError() {
        displayCalledError = true
    }
    
    
}
