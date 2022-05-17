

import Foundation

class ImageViewModelToModelMapper: Mapper<[ImageViewModel], PicturesList> {
    override func reverseMap(value : PicturesList) -> [ImageViewModel] {
        return value.message.map{  ImageViewModel(name: $0 ) }
    }
}
