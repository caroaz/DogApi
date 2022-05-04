

import UIKit

class ImageViewController: UIViewController {
    
    
    var dataContent : String = ""
    var breedList :  [String] = []
    
    var tableImageView = UITableView ()
//    var dogImagesRepository: DogRepository?
    var pictureUserCase : GetPicturesUseCase?
    
    struct Cells{
        static let mycell = "my cell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        configureTableImageView()
        
        print(dataContent)
        pictureUserCase?.execute(breed: dataContent) { breeds, error in
            //
            DispatchQueue.main.async {
                guard let breeds = breeds else {
                    print(error?.description ?? "Error")
                    return
                }
                self.breedList = breeds.message
                self.tableImageView.reloadData()
            }
        }
    }
    
    // Remove Subviews Or Layers That Were Added Just For This Cell
    
    
    //    func fetchData(){
    //        let urlString = "https://dog.ceo/api/breed/\(dataContent)/images"
    //
    //        let url = URL(string: urlString)
    //        guard url != nil else{
    //            return }
    //            let session = URLSession.shared
    //            let dataTask = session.dataTask(with: url!){
    //                (data, response, error) in
    ////                chekear errores
    //                if error == nil && data != nil {
    ////                    parse json
    //                    let decoder = JSONDecoder()
    //                    do {
    //                   let breedList = try decoder.decode(Breed.self, from: data!)
    //                        print(breedList)
    //                    }
    //                    catch{
    //                        ("error in json")
    //                    }
    //                }
    //            }
    //        dataTask.resume()
    //        }
    
    
    
    
    func configureTableImageView() {
        view.addSubview(tableImageView)
        setTableViewDelegates()
        tableImageView.estimatedRowHeight = 200
        tableImageView.rowHeight = UITableView.automaticDimension
        
        tableImageView.register(ImageViewCell.self, forCellReuseIdentifier: Cells.mycell)
        tableImageView.pin(to :view)
        
    }
    func setTableViewDelegates(){
        tableImageView.dataSource = self
        tableImageView.delegate = self
    }
    
}



//
extension ImageViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return breedList.count
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:Cells.mycell, for: indexPath as IndexPath) as? ImageViewCell else { return UITableViewCell()}
        
        cell.resultsBreedName =  breedList[indexPath.row]
        
        cell.prepare()
        
        
        return cell
        
        
    }
   
}


extension ImageViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

