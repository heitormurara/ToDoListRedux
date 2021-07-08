import UIKit
import ReSwift

final class ToDoListViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private lazy var addBarButtonItem: UIBarButtonItem = {
        UIBarButtonItem(image: UIImage(systemName: "plus"),
                        style: .plain,
                        target: self,
                        action: #selector(addToDo))
    }()
    
    private var tableViewDataSource: [ToDo] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        store.subscribe(self) {
            $0.select { $0.toDoListState }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    private func setUpUI() {
        navigationItem.rightBarButtonItem = addBarButtonItem
        view.addSubview(tableView)
        
        let constraints = [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc
    private func addToDo() {
        let routingAction = RoutingAction(destination: .add)
        store.dispatch(routingAction)
    }
}

// MARK: - UITableViewDataSource
extension ToDoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        tableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")

        cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell?.textLabel?.text = tableViewDataSource[indexPath.row].name
        
        return cell ?? UITableViewCell()
    }
}

// MARK: - StoreSubscriber
extension ToDoListViewController: StoreSubscriber {
    
    func newState(state: ToDoListState) {
        tableViewDataSource = state.toDos
        tableView.reloadData()
    }
}
