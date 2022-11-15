import UIKit

class Registration: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var connfirmPasswordField: UITextField!

    public var saveUsername: ((String?) -> ())?
    public var savePassword: ((String?) -> ())?
    public var saveEmail: ((String?) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func signUpButton(_ sender: Any) {
        if entered() {
            saveUsername?(usernameField.text!)
            saveEmail?(emailField.text!)
            savePassword?(passwordField.text!)
            alerts()
        } else {
            enterData()
        }
    }

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

    func entered() -> Bool {
        if usernameField.hasText && emailField.hasText && passwordField.hasText {
            return true
        }
        return false
    }

    func alerts() {
        if passwordField.text != connfirmPasswordField.text {
            showAlert()
        }
        if passwordField.text!.count <= 8 {
            secureAlert()
        }else {
            navigationController?.popViewController(animated: true)
        }
    }


    func showAlert() {
        let alertController = UIAlertController(title: "Sorry", message: "passwords doesn't match", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }

    func secureAlert() {
        let alertController = UIAlertController(title: "Sorry", message: "This password is not secure", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }

    func enterData() {
        let alertController = UIAlertController(title: "Sorry", message: "Please enter all data", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
}
