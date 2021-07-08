import UIKit
import ReSwift

final class AddToDoViewController: UIViewController {
    
    private let toDoNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "To Do"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var saveBarButtonItem: UIBarButtonItem = {
        UIBarButtonItem(title: "Save",
                        style: .plain,
                        target: self,
                        action: #selector(saveToDo))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        navigationItem.rightBarButtonItem = saveBarButtonItem
        
        view.backgroundColor = .white
        view.addSubview(toDoNameTextField)
        
        let safeArea = view.safeAreaLayoutGuide
        
        let constraints = [
            toDoNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                       constant: 16),
            toDoNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                       constant: -16),
            toDoNameTextField.topAnchor.constraint(equalTo: safeArea.topAnchor,
                                                       constant: 16),
            toDoNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc
    private func saveToDo() {
        guard let text = toDoNameTextField.text else { return }
        
        let toDo = ToDo(name: text)
        let appendToDoAction = AppendToDoAction(toDo: toDo)
        
        store.dispatch(appendToDoAction)
    }
}
