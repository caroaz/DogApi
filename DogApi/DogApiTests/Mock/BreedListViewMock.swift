
import Foundation
@testable import DogApi

class BreedListViewMock: BreedListView {
    var dogList: [BreedsViewModel]
    
    
    var displayListCalled = false
    var displayErrorCalled = false
    var showNextViewControllerCalled = false
    
    init(dogList: [BreedsViewModel]) {
        self.dogList = dogList
    }
    func display(_ list: [BreedsViewModel]) {
        displayListCalled = true
    }
    
    func showNextVIewController(name: String) {
        showNextViewControllerCalled = true
    }
    
    
    func displayError() {
        displayErrorCalled = true
    }
    
        
    
}
