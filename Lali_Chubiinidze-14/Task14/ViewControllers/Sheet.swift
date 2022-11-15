import UIKit

class Sheet: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad() 
    }
    
    @IBAction func showLoginPage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login") as? Login
        guard let vc = vc else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }

    @IBAction func dismiss(_ sender: Any) {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
