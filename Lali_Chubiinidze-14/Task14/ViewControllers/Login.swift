import UIKit

class Login: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var validUser: String?
    var validPassword: String?
    var validEmail: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

// MARK: - Actions

    @IBAction func signUpButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Registration") as? Registration
        guard let vc = vc else { return }
        vc.saveUsername = { value in
            self.validUser = value
        }
        vc.savePassword = { value in
            self.validPassword = value
        }
        vc.saveEmail = { value in
            self.validEmail = value
        }
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func signInButton(_ sender: Any) {
        if username.text == validUser && password?.text == validPassword {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Detail") as? Detail

            guard let vc = vc else {return}
            vc.username2 = validUser
            vc.email2 = validEmail
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            showAlert()
        }
    }
    func showAlert() {
        let alertController = UIAlertController(title: "Oops!", message: "incorrect credentials", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
}

