import UIKit
import Hero

class TrainingMenuViewController: UIViewController {

    @IBOutlet weak var audingButton: UIButton!
    @IBOutlet weak var wideButtonsCollectionView: UICollectionView!
    
    @IBOutlet weak var tightButtonsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        wideButtonsCollectionView.delegate = self
        wideButtonsCollectionView.dataSource = self
        
        tightButtonsCollectionView.delegate = self
        tightButtonsCollectionView.dataSource = self
        
        audingButton.backgroundColor = UIColor(named: "Blue")
        audingButton.layer.cornerRadius = 14.0
        audingButton.clipsToBounds = true
        
        self.hero.isEnabled = true
        self.hero.modalAnimationType = .pageIn(direction: .left)
        
        
       
    }

}

extension TrainingMenuViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == wideButtonsCollectionView {
            if indexPath.row == 0 {
                // FIXME: paramater
                segue(self, navigator: RegularTestViewController())
            } else {
                segue(self, navigator: RegularTestViewController())
            }
        } else {
            
        }
    }
    
}

extension TrainingMenuViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == wideButtonsCollectionView {
        let cell = wideButtonsCollectionView.dequeueReusableCell(withReuseIdentifier: "WideButtonsCollectionViewCell", for: indexPath) as! WideButtonsCollectionViewCell
        
        switch indexPath.row {
        case 0:
            cell.label.text = "Слово-перевод"
            cell.background_view?.backgroundColor = UIColor(named: "Blue")
            cell.image.image = UIImage(named: "brain")
        case 1:
            cell.label.text = "Перевод-слово"
            cell.background_view?.backgroundColor = UIColor(named: "Violet")
            cell.image.image = UIImage(named: "hat")
        default: break
        }
        
        return cell
        } else {
            let cell = tightButtonsCollectionView.dequeueReusableCell(withReuseIdentifier: "TightButtonsCollectionViewCell", for: indexPath) as! TightButtonsCollectionViewCell
            switch  indexPath.row {
            case 0:
                cell.label.text = "Говорение"
                cell.background_view?.backgroundColor = UIColor(named: "Blue")
                cell.image.image = UIImage(named: "pc")
            case 1:
                cell.label.text = "Аудирование"
                cell.background_view?.backgroundColor = UIColor(named: "Violet")
                cell.image.image = UIImage(named: "book")
            default:
                cell.backgroundView?.backgroundColor = UIColor(named: "Blue")
            }
            
            return cell
        }
    }
    
    
}

extension TrainingMenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == wideButtonsCollectionView {
            return CGSize(width: wideButtonsCollectionView.frame.width - 50, height: wideButtonsCollectionView.frame.height)
        } else {
            return CGSize(width: tightButtonsCollectionView.frame.width - 50, height: tightButtonsCollectionView.frame.height)
        }
       
       }
}
