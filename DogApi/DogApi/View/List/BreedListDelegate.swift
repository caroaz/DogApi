
import Foundation
import UIKit
class BreedListDelegate : NSObject {
    weak var view : BreedListViewController?
}
extension BreedListDelegate: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        si no encunetra la vista no devuelve nada
        guard let view = view else {
            return
        }
        let vcDetail = ImageViewController(imageViewDatasource: ImageViewDataSource())
        vcDetail.dataContent = view.dogList[indexPath.row].name
        
        
        
        let pictureUseCase = DogCeoServiceLocator().pictureUseCase
        
        
        vcDetail.pictureUserCase = pictureUseCase
        
        
        view.navigationController?.pushViewController(vcDetail, animated: true)
    }
}
