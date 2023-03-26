import UIKit

class EntryViewController: UIViewController {

    @IBOutlet weak var buttonContainerView: UIView!
    
    @IBOutlet weak var buttonContainerViewHeightConstant: NSLayoutConstraint!
    
    @IBOutlet var roundedButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         buttonContainerViewHeightConstant.constant = 0.0
//        buttonContainerView.layoutSubviews()
        
        self.buttonContainerView.transform = CGAffineTransform(translationX: 0, y: 331)
        
        for x in roundedButtons {
            x.layer.cornerRadius = 10.0
            x.clipsToBounds = true
        }

        UIView.animate(withDuration: 1.0) {
             self.buttonContainerView.transform = CGAffineTransform(translationX: 0, y: 0)
          
        }
        
    }
    
    @IBAction func onLoginButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func onCreateAccountButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func onSkipLoginButtonTapped(_ sender: UIButton) {
    }
}
