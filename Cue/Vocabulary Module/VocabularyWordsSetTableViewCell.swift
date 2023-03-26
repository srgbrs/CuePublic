import UIKit

class VocabularyWordsSetTableViewCell: UITableViewCell {

    @IBOutlet weak var wordTitle: UILabel!
    
    @IBOutlet weak var translationTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
