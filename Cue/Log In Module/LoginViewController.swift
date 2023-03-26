import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet var roundedContainerViews: [UIView]!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hero.isEnabled = true
        self.hero.modalAnimationType = .push(direction: .left)
        

        for x in roundedContainerViews {
            x.layer.cornerRadius = 16.0
            x.clipsToBounds = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.hero.modalAnimationType = .pull(direction: .right)
    }

    @IBAction func onRegistrationButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func onLoginButtonTapped(_ sender: UIButton) {
        segue(self, navigator: TabBarController())
    }
    
    @IBAction func onForgotPasswordButtonTapped(_ sender: UIButton) {
    }
}
