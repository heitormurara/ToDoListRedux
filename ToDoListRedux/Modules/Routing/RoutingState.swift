import ReSwift

struct RoutingState {
    
    var navigationState: RoutingDestination
    
    init(navigationState: RoutingDestination = .list) {
        self.navigationState = navigationState
    }
}
