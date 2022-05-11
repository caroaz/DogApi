

import Foundation
import UIKit

class BreedListDataSource: NSObject {
    weak var view : BreedListViewController?
    
}
extension BreedListDataSource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return view?.dogList.count ?? 0
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let view = view else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath as IndexPath) as! myCell
    
        cell.results =  view.dogList[indexPath.row].name
        
        cell.prepare()
        
        
        return cell
        
        
    }
}
