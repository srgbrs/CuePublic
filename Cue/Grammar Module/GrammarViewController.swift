import UIKit
import RealmSwift


class GrammarViewController: UIViewController {

    @IBOutlet weak var grammarModulesCollectionView: UITableView!
    
    var tenses = ["Present Simple", "Past Simple", "Present Continious", "Past Continious", "Present Perfect", "Past Perfect", "Future Simple", "Future Continious", "Future Perfect"]
    var tensesTranslate = ["Простое настоящее время", "Простое прошедшее", "Настоящее продолженное время", "Прошедшее продолженное время" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grammarModulesCollectionView.delegate = self
        grammarModulesCollectionView.dataSource = self

    }

}

extension GrammarViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension GrammarViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = grammarModulesCollectionView.dequeueReusableCell(withIdentifier: "GrammarModuleTableViewCell") as! GrammarModuleTableViewCell
        cell.moduleMainTitle.text = tenses[indexPath.row]
        return cell
    }
    
    
}
