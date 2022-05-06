
import Foundation


class BreedListToArrayMapper: Mapper<BreedsList, [String]> {
    
    override func reverseMap(value : [String]) -> BreedsList {
        return BreedsList(message: value)
    }

}



