

import UIKit

class ImageListViewController: UIViewController {
    var imageViewDatasource = ImageViewDataSource ()
    var imageViewDelegate = ImageViewDelegate()
    private var presenter : ImageListPresenterProtocol?
    
    var dataContent : String = ""
    var breedList :  [ImageViewModel] = []
    var tableImageView = UITableView ()
    var pictureUserCase : GetPicturesUseCase?
    
    //    struct Cells{
    //        static let mycell = "my cell"
    //    }
    convenience init(imageViewDatasource:ImageViewDataSource, imageViewDelegate: ImageViewDelegate, presenter : ImageListPresenterProtocol){
        self.init()
        self.imageViewDatasource = imageViewDatasource
        self.imageViewDelegate = imageViewDelegate
        self.presenter = presenter
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureTableImageView()
        
        print(dataContent)
//        pictureUserCase?.execute(breed: dataContent) { [self] breeds, error in
            //
//            DispatchQueue.main.async {
//                guard let breeds = breeds else {
//                    print(error?.description ?? "Error")
//                    return
//                }
//                self.breedList = breeds.message
//                self.tableImageView.reloadData()
//            }
//        }
            presenter?.getImageList(breed: dataContent)
    }
  
    
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
extension ImageListViewController: ImageListView{
    func display(_ list: [ImageViewModel]) {
        breedList = list
        tableImageView.reloadData()
    }
    
    func displayError() {
        print("Error")
    }
    
    
}
