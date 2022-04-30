import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var pasField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

  

    @IBAction func login(_ sender: UIButton) {
        let email = emailField.text!
        let password = pasField.text!
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
          // ...
            print(authResult?.user.uid)
        }
    }
    
    @IBAction func reg(_ sender: UIButton) {
        let email = emailField.text!
        let password = pasField.text!
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
            print(authResult?.user.uid)
        }
    }
    @IBAction func checkButon(_ sender: Any) {
        if Auth.auth().currentUser != nil {
          // User is signed in.
          // ...
            print(Auth.auth().currentUser?.uid)
        } else {
          // No user is signed in.
          // ...
            print("no user")
        }
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        
            let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
}

