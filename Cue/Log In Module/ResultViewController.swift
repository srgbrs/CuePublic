import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onBackButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

