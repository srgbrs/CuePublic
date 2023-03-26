import UIKit

class TightButtonsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var background_view: UIView!
    
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        background_view?.layer.cornerRadius = 14.0
        background_view?.clipsToBounds = true
    }
}
