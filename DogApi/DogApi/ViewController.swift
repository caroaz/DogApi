

import UIKit

class ViewController: UIViewController {
    
    var dogList :  [String] = []
    var tableView = UITableView ()
    var breedUseCase : GetBreedUseCase?
    
    struct Cells{
        static let mycell = "my cell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        title = "DogCeo"
        configureTableView()
        
        breedUseCase?.execute{ dogs, error in
            
            DispatchQueue.main.async {
                guard let dogs = dogs else {
                    print(error?.description ?? "error")
                    return
                }
                self.dogList = dogs.message
                self.tableView.reloadData()
            }
        }
        
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(myCell.self, forCellReuseIdentifier: Cells.mycell)
        tableView.pin(to :view)
        
    }
    func setTableViewDelegates(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}


extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dogList.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:Cells.mycell, for: indexPath as IndexPath) as! myCell
        ////        let expandencell = self.characterList[indexPath.row]
        cell.results =  dogList[indexPath.row]
        
        cell.prepare()
        
        
        return cell
        
        
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcDetail = ImageViewController()
        vcDetail.dataContent = dogList[indexPath.row]
        
        let restApiCall = CallApiDog()
        let mapper = BreedListToArrayMapper()
        let mapperPicture = PictureListToArrayMapper()
        
        let repository = DogApiRepository(restApi: restApiCall, mapper: mapper, imageMapper: mapperPicture)
        
        
        vcDetail.pictureUserCase = GetPicturesUseCase(dogRepository: repository)
        
        
        navigationController?.pushViewController(vcDetail, animated: true)
    }
    
}




