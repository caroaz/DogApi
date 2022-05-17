
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

        let vcDetail = ViewControllerFactory.makeImageListViewController()
     
        vcDetail.dataContent = view.dogList[indexPath.row].name
 
        view.navigationController?.pushViewController(vcDetail, animated: true)
    }
}
