import ReSwift

func toDoListReducer(action: Action, state: ToDoListState?) -> ToDoListState {
    
    var state = state ?? ToDoListState()
    
    switch action {
    case let appendToDoAction as AppendToDoAction:
        var newToDos = state.toDos
        newToDos.append(appendToDoAction.toDo)
        state = ToDoListState(toDos: newToDos)
    default:
        break
    }
    
    return state
}
