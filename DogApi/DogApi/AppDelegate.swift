
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
     let presenter = BreedListPresenter(breedUseCase: DogCeoServiceLocator().breedUseCase)
//        crear instancia viewController
        let viewController = BreedListViewController(
            viewDataSource: BreedListDataSource(),
            viewDelegate: BreedListDelegate(),
            presenter: presenter)

        presenter.view = viewController
//        viewController.breedUseCase = DogCeoServiceLocator().breedUseCase
//        cambiar root ViewController() por instancia de viewController
        let navigationController = UINavigationController(rootViewController:  viewController)
        window?.rootViewController = navigationController
        return true
    }
    
    
}

