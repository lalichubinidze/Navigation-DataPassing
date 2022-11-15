import UIKit

class Detail: UIViewController {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!

    var username2: String!
    var email2: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.username.text = username2
        self.email.text = email2
    }

    @IBAction func presentSheet(_ sender: Any) {
        guard let myView = Bundle.main.loadNibNamed("BottomSheet", owner: nil, options: nil)![0] as? BottomSheet else { return }
        myView.action = {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Login") as? Login
            guard let vc = vc else { return }
            self.navigationController?.viewControllers = [vc]
        }
        myView.frame = CGRect(x: 30, y: 350, width: 325, height: 150)
        view.addSubview(myView)
    }


}
