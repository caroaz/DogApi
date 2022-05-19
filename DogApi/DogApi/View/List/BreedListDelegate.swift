import Foundation
import UIKit
class BreedListDelegate : NSObject {
    weak var view : BreedListView?
}
extension BreedListDelegate: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        si no encunetra la vista no devuelve nada
        guard let view = view else {
            return
        }
        
        let cellContent = view.dogList[indexPath.row]
        view.showNextVIewController(name: cellContent.name)
 
      
    }
}
