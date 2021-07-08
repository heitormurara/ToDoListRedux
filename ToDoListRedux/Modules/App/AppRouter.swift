import UIKit
import ReSwift

final class AppRouter {
    
    let navigationController: UINavigationController
    
    init(window: UIWindow) {
        navigationController = UINavigationController()
        window.rootViewController = navigationController
        
        store.subscribe(self) {
            $0.select { $0.routingState }
        }
    }
}

// MARK: - StoreSubscriber
extension AppRouter: StoreSubscriber {

    func newState(state: RoutingState) {
        let animated = navigationController.topViewController != nil
        
        let newViewController = state.navigationState.viewController
        let newViewControllerType = type(of: newViewController)
        
        if let currentViewController = navigationController.topViewController {
            let currentViewControllerType = type(of: currentViewController)
            if currentViewControllerType == newViewControllerType {
                return
            }
        }
        
        navigationController.pushViewController(newViewController,
                                                animated: animated)
    }
}
