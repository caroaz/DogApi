import UIKit
@testable import DogApi

class BreedsListViewControllerMock: BreedListViewController {
    var viewDataSourceMock: BreedListDataSource?
    var viewDelegateMock: BreedListDelegate?
    
    let breedsListTableMock = UITableView()
    
    override func viewDidLoad() {
        breedsListTableMock.dataSource = viewDataSourceMock
        breedsListTableMock.delegate = viewDelegateMock
        
        prepareTableView()
    }
    
    private func prepareTableView() {
        view.addSubview(breedsListTableMock)
        breedsListTableMock.pin(to: view)
        breedsListTableMock.register(myCell.self, forCellReuseIdentifier: "cell")
        title = "DOG BREEDS"
    }
}
