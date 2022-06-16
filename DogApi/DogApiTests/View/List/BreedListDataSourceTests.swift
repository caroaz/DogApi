

import XCTest
@testable import DogApi

class BreedListDataSourceTests: XCTestCase {

    var sut : BreedListDataSource!
    var tableView: UITableView!
    
    override func setUp(){
        super.setUp()
        sut = BreedListDataSource()
        tableView = UITableView()
        
    }

    override func tearDown() {
        super.tearDown()
       sut = nil
    }

    func testNumberofRowsInSection()  {
       let viewController = BreedListViewController()
        
        viewController.dogList = [BreedsViewModel(name: "akita"),BreedsViewModel(name: "beagle")]
        sut.view = viewController
        let numberOfRow = sut.tableView(UITableView() , numberOfRowsInSection: 0)
        
        XCTAssertEqual( numberOfRow, 2 )
    }
    func testNumberofRowsInSectionWhitNilView(){
        sut.view = nil
        let rows = sut.tableView(UITableView() , numberOfRowsInSection: 0)
        XCTAssertEqual( rows, 0)
    }
    
    func testCellForRowAtIndexPath (){
        let viewController = BreedListViewController()
        viewController.dogList = [BreedsViewModel(name: "asdf")]
        sut.view = viewController
        viewController.viewDidLoad()
        let tableview = viewController.view.subviews[0] as! UITableView
        let cell = sut.tableView(tableview, cellForRowAt: IndexPath(row: 0, section: 0)) as! myCell
        XCTAssertEqual( cell.results, "asdf")
    }

 
}
