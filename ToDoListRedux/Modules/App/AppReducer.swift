import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    let routingState = routingReducer(action: action, state: state?.routingState)
    let toDoListState = toDoListReducer(action: action, state: state?.toDoListState)
    
    return AppState(routingState: routingState,
                    toDoListState: toDoListState)
}
