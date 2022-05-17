
import UIKit
class ViewControllerFactory {
    
    static private let serviceLocator = DogCeoServiceLocator()
    
    static func makeBreedListViewController() -> BreedListViewController{
        
        let presenter = BreedListPresenter(breedUseCase: serviceLocator.breedUseCase, breedMapper: BreedViewModelToModelMapper())
        let viewController = BreedListViewController(viewDataSource: BreedListDataSource(), viewDelegate: BreedListDelegate(), presenter: presenter)
        presenter.view = viewController
        return viewController
    }
    
    static func makeImageListViewController() -> ImageListViewController{
        let presenter = ImageListPresenter(pictureUseCase: serviceLocator.pictureUseCase, imageMapper: ImageViewModelToModelMapper())
        
        let imageViewController = ImageListViewController(imageViewDatasource: ImageViewDataSource(), imageViewDelegate: ImageViewDelegate(), presenter: presenter)
        presenter.view = imageViewController
        return imageViewController
        
    }
  
}
