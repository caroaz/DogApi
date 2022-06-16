
import Foundation
import UIKit

class ImageViewDataSource : NSObject {
    weak var view : ImageListViewController?
    
}
extension ImageViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return view?.picturesList.count ?? 0
        
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"cellImage", for: indexPath as IndexPath) as? ImageViewCell
        else {
            return UITableViewCell()
            
        }
        
        cell.resultsBreedName =  view?.picturesList[indexPath.row].name
        
        cell.prepare()
        
        
        return cell
        
    }
}
