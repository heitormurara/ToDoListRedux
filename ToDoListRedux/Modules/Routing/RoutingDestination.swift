import UIKit

enum RoutingDestination {
    
    case list
    case add
    
    var viewController: UIViewController {
        switch self {
        case .list:
            return ToDoListViewController()
        case .add:
            return AddToDoViewController()
        }
    }
}
