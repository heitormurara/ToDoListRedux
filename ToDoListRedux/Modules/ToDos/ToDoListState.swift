private let mockToDos = [ToDo(name: "To Do 1"),
                         ToDo(name: "To Do 2"),
                         ToDo(name: "To Do 3"),
                         ToDo(name: "To Do 4"),
                         ToDo(name: "To Do 5")]

struct ToDoListState {
    
    let toDos: [ToDo]
    
    init(toDos: [ToDo] = mockToDos) {
        self.toDos = toDos
    }
}
