import UIKit

class DetailedWordViewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var wordImage: UIImageView!
    
    @IBOutlet weak var wordTitle: UILabel!
    
    @IBOutlet weak var wordTranslation: UILabel!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 16.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.gray.cgColor
    }
    
}
