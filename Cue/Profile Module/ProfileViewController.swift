import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var roundContainers: [UIView]!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var wordsLearnedCounterDay: UILabel!
    
    @IBOutlet weak var wordsLearnedCounterWeek: UILabel!
    
    @IBOutlet weak var trainingsPassedCounterDay: UILabel!
    
    @IBOutlet weak var trainingsPassedCounterWeek: UILabel!
    
    @IBOutlet weak var avatarImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in roundContainers {
            x.layer.cornerRadius = 10
            x.clipsToBounds = true
        }

    }
}
