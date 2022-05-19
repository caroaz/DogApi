

import UIKit

class BreedListViewController: UIViewController {
    private var viewDatasource : BreedListDataSource?
    private var viewDelegate : BreedListDelegate?
    
    private var presenter : BreedListPresenterProtocol?
    var dogList :  [BreedsViewModel] = []
    var tableView = UITableView ()
    
    
    // Creamos convenience initializers en una clase como atajos para inicializar una clase, para que no sea nos ahorre tiempo y sea más claro.
    convenience init(viewDataSource: BreedListDataSource, viewDelegate: BreedListDelegate, presenter : BreedListPresenterProtocol){
        self.init()
        self.viewDatasource = viewDataSource
        self.viewDelegate = viewDelegate
        self.presenter = presenter
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        title = "DogCeo"
        configureTableView()
        
        presenter?.getBreedList()
        
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(myCell.self, forCellReuseIdentifier: "cell")
        tableView.pin(to :view)
        
    }
    func setTableViewDelegates(){
        tableView.dataSource = viewDatasource
        viewDatasource?.view = self
        
        tableView.delegate = viewDelegate
        viewDelegate?.view = self
    }
    
}

extension BreedListViewController: BreedListView{
    
    
    func showNextVIewController(name: String) {
        let vcDetail = ViewControllerFactory.makeImageListViewController()
     
        vcDetail.dataContent = name
 
        self.navigationController?.pushViewController(vcDetail, animated: true)
    }
    
    func display(_ list: [BreedsViewModel]) {
        dogList = list
        tableView.reloadData()
    }
    
    func displayError() {
        print("Error")
    }
    
    
}

