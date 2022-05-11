

import Foundation
import UIKit

class ImageViewDataSource : NSObject {
    weak var view : ImageViewController?
    
}
extension ImageViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return view?.breedList.count ?? 0
        
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"cellImage", for: indexPath as IndexPath) as? ImageViewCell else {
            return UITableViewCell()
            
        }
        
        cell.resultsBreedName =  view?.breedList[indexPath.row]
        
        cell.prepare()
        
        
        return cell
        
    }
}
