

import Foundation
import UIKit
class ImageViewDelegate: NSObject {
    
    weak var view : ImageViewController?
    
}
extension ImageViewDelegate: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
