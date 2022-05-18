
import XCTest
@testable import DogApi

class ImageListDataSourceTests: XCTestCase {

    var sut : ImageViewDataSource!
    var tableView: UITableView!
    
    override func setUp(){
        super.setUp()
        sut = ImageViewDataSource()
        tableView = UITableView()
        
    }

    override func tearDown() {
        super.tearDown()
       sut = nil
    }

    func testNumberofRowsInSection()  {
       let viewController = ImageListViewController()
        
        viewController.breedList = [ImageViewModel(name: "akita"),ImageViewModel(name: "beagle")]
        sut.view = viewController
        let numberOfRow = sut.tableView(UITableView() , numberOfRowsInSection: 0)
        
        XCTAssertEqual( numberOfRow, 2 )
    }
    func testNumberofRowsInSectionWhitNilView(){
        sut.view = nil
        let rows = sut.tableView(UITableView() , numberOfRowsInSection: 0)
        XCTAssertEqual( rows, 0)
    }
    
//    func testCellForRowAtIndexPath (){
//        let viewController = ImageListViewController()
//        viewController.breedList = [ImageViewModel(name: "asdf")]
//        sut.view = viewController
//        viewController.viewDidLoad()
//        let tableview = viewController.view.subviews[0] as! UITableView
//        let cell = sut.tableView(tableview, cellForRowAt: IndexPath(row: 0, section: 0)) as! ImageViewCell
////        XCTAssertEqual( cell., 0)
//    }
}
