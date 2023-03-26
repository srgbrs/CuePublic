import UIKit

class DetailedWordViewViewController: UIViewController {

    @IBOutlet weak var detailedWordViewCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailedWordViewCollectionView.delegate = self
        detailedWordViewCollectionView.dataSource = self

    }
    @IBAction func onNavBarBackButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
extension DetailedWordViewViewController : UICollectionViewDelegate {
    
}

extension DetailedWordViewViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailedWordViewCollectionViewCell", for: indexPath) as! DetailedWordViewCollectionViewCell
        return cell
    }
    
    
}

extension DetailedWordViewViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: detailedWordViewCollectionView.frame.width - 50, height: detailedWordViewCollectionView.frame.width - 50)
       }
}
