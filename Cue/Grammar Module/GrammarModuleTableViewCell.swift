import UIKit

class GrammarModuleTableViewCell: UITableViewCell {

    @IBOutlet weak var moduleMainTitle: UILabel!
    
    @IBOutlet weak var progressBarBackground: UIView!
    
    @IBOutlet weak var progressBarFulfillment: UIView!
    
    @IBOutlet weak var moduleAdditionalTitle: UILabel!
    
    @IBOutlet weak var canvasView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        canvasView.layer.cornerRadius = 10.0
        canvasView.clipsToBounds = true
        
        progressBarBackground.layer.cornerRadius = 5.0
        progressBarBackground.clipsToBounds = true
        
        progressBarFulfillment.layer.cornerRadius = 5.0
        progressBarFulfillment.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
