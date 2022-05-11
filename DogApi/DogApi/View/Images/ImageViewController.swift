

import UIKit

class ImageViewController: UIViewController {
    var imageViewDatasource = ImageViewDataSource ()
    var imageViewDelegate = ImageViewDelegate()
    
    var dataContent : String = ""
    var breedList :  [String] = []
    var tableImageView = UITableView ()
    var pictureUserCase : GetPicturesUseCase?
    
    //    struct Cells{
    //        static let mycell = "my cell"
    //    }
    convenience init(imageViewDatasource:ImageViewDataSource){
        self.init()
        self.imageViewDatasource = imageViewDatasource
        
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
        
        tableImageView.register(ImageViewCell.self, forCellReuseIdentifier: "cellImage")
        tableImageView.pin(to :view)
        
    }
    func setTableViewDelegates(){
        tableImageView.dataSource =  imageViewDatasource
        imageViewDatasource.view = self
        
        tableImageView.delegate = imageViewDelegate
        imageViewDelegate.view = self
    }
    
}


