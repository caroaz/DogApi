
import Foundation
class PictureListToArrayMapper: Mapper<PicturesList, [String]> {
    
    override func reverseMap(value : [String]) -> PicturesList {
        return PicturesList(message: value)
    }
    
}
