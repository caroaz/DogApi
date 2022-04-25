

import UIKit

class ViewController: UIViewController {
    
    var dogList :  [String] = []
    
    var tableView = UITableView ()
    
    var callApi : ApiRest?
    
    
    struct Cells{
        static let mycell = "my cell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dogList)
        
        view.backgroundColor = .white
        title = "DogCeo"
        configureTableView()
        
        callApi?.fetchData { dogs, error in
            
            DispatchQueue.main.async {
                guard let dogs = dogs else {
                    print(error?.message ?? "error")
                    return
                }
                self.dogList = dogs
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



//
extension ViewController: UITableViewDataSource{
    
    //        indica cuantas celdas queremos que tenga nuestra tabla
    
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
        //        print(dogList[indexPath.row])
        
        
        let vcDetail = ImageViewController()
        vcDetail.dataContent = dogList[indexPath.row]
        vcDetail.callApi = CallApiDog()
        
        
        navigationController?.pushViewController(vcDetail, animated: true)
    }
    
}




