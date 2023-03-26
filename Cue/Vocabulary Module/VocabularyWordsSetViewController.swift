import UIKit

class VocabularyWordsSetViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navigationBarBAckButton: UIButton!
    
    @IBOutlet weak var wordsSetImage: UIImageView!
    
    @IBOutlet weak var wordsSetTitleLabel: UILabel!
    
    @IBOutlet weak var studyButton: UIButton!
    
    var testWords = ["a car", "a dog"]
    var translateWords = ["машина", "собака"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studyButton.layer.cornerRadius = 16.0
        studyButton.clipsToBounds = true
        
        tableView.delegate = self
        tableView.dataSource = self

    }

    @IBAction func onStudyButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func onNavBarBackButtonTapped(_ sender: UIButton) {
        print("back button")
    }
}


extension VocabularyWordsSetViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        segue(self, navigator: DetailedWordViewViewController())
    }
}

extension VocabularyWordsSetViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VocabularyWordsSetCell") as! VocabularyWordsSetTableViewCell
        cell.wordTitle.text = testWords[indexPath.row]
        cell.translationTitle.text = translateWords[indexPath.row]
        return cell
    }
    
    
}

extension UIViewController {
     func segue<T>( _ parent: UIViewController, navigator: T) {

        let name = String(describing: navigator.self)
        let vc = parent.storyboard?.instantiateViewController(withIdentifier: String(describing: T.self)) as! T

        (vc as! UIViewController).modalTransitionStyle = .crossDissolve

        (vc as! UIViewController).modalPresentationStyle = .fullScreen
        parent.present(vc as! UIViewController, animated: true, completion: nil)
    }
    
    func segue<T>( _ parent: UIViewController, navigator: T, custom: String) {

       let name = custom
       let vc = parent.storyboard?.instantiateViewController(withIdentifier: String(describing: T.self)) as! T

       (vc as! UIViewController).modalTransitionStyle = .crossDissolve

       (vc as! UIViewController).modalPresentationStyle = .fullScreen
       parent.present(vc as! UIViewController, animated: true, completion: nil)
   }

}


