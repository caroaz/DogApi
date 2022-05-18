
import Foundation
class ImageListPresenter: ImageListPresenterProtocol{
    
    private let  pictureUseCase : GetPicturesUseCase
    private let imageMapper : Mapper<[ImageViewModel], PicturesList>
    weak var  view: ImageListView?
    
//    por constructor
    init (pictureUseCase : GetPicturesUseCase, imageMapper : Mapper<[ImageViewModel], PicturesList>){
        self.pictureUseCase = pictureUseCase
        self.imageMapper = imageMapper
   
    }
    func getImageList(breed: String) {
    pictureUseCase.execute(breed: breed) { [weak self] list, error in
        if let list = list {
            let breeds = self?.imageMapper.reverseMap(value: list)
//                opcionales en cadena
            self?.view?.display(breeds ?? [])
        }
        else {
            self?.view?.displayError()
        }
    }
}

}
