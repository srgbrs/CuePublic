import UIKit
import Hero

enum Status {
    case notStarted
    case going
    case ended
}

class RegularTestViewController: UIViewController {
    
    var words = ["door", "tree", "car"]
    var answers = [["кровать", "машина", "завод", "дверь"], ["дерево","ирод","тачка","стол"],["машина","приход","изоляция","улыбка"]]
    
    var right = [3,0,0]

    @IBOutlet var answerButtonsCollection: [UIButton]!
    
    @IBOutlet weak var wordTitleLabel: UILabel!
    
    @IBOutlet weak var firstAnswerButton: UIButton!
    
    @IBOutlet weak var resultViewCanvas: UIView!
    
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    
    @IBOutlet weak var fourthAnswerButton: UIButton!
    
    var manager = WordTranslationTrainingManager()
    
   
    
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultViewCanvas.isHidden = true
        resultViewCanvas.layer.cornerRadius = 12
        resultViewCanvas.clipsToBounds = true
        resultViewCanvas.layer.borderWidth = 3
        resultViewCanvas.layer.borderColor = UIColor(named: "border")?.cgColor
        
        for x in answerButtonsCollection {
            x.layer.cornerRadius = 20.0
            x.clipsToBounds = true
        }
        
        // works! 
        
        self.hero.isEnabled = true
        self.hero.modalAnimationType = .push(direction: .left)
        
        
        manager.setSource(answerButtons: answerButtonsCollection, wordTitle: wordTitleLabel, wordSet: words, answers: answers)
        manager.start()
        updateCounterLabel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.hero.modalAnimationType = .pull(direction: .right)
    }
    
    func updateCounterLabel() {
        counterLabel.text = "\(manager.currentIndex) / \(manager.totalQuantity)"
    }
    
    @IBAction func onNavBarBackButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onAnswerButtonsTapped(_ sender: UIButton) {
        print("action")
        
       //  animate()
        manager.next()
        if manager.status == Status.ended {
            resultViewCanvas.isHidden = false
        }
        updateCounterLabel()
        
    }
    
    func animate() {
        firstAnswerButton.blink(duration: 1, delay: 0.1, alpha: 1.0)
    }
}


extension UIButton {
    func blink(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, alpha: CGFloat = 1) {
        self.backgroundColor = .red
        UIButton.animate(withDuration: duration, delay: delay, options: [.curveEaseInOut, .autoreverse], animations: {
            self.alpha = alpha
        })
    }
}

class WordTranslationTrainingManager {
    
//    enum Status {
//        case notStarted
//        case going
//        case ended
//    }
    
    var status : Status = .notStarted
    var wordSet : [String] = []
    var answerString : [[String]] = [[]]
    var rightAnswerIndex : [Int] = []
    
    var gamePoints : Int = 0
    
    var answerButtons : [UIButton] = []
    var wordTitle : UILabel = UILabel()
    
    var currentIndex = 0
    var totalQuantity = 0
    
    init(answerButtons : [UIButton], wordTitle: UILabel, wordSet: [String], answers: [[String]]) {
        self.answerButtons = answerButtons
        self.wordTitle = wordTitle
        
        self.wordSet = wordSet
        self.answerString = answers
        
        self.totalQuantity = wordSet.count
    }
    
    init() {
        
    }
    
    func setSource(answerButtons : [UIButton], wordTitle: UILabel, wordSet: [String], answers: [[String]]) {
        self.answerButtons = answerButtons
        self.wordTitle = wordTitle
        
        self.wordSet = wordSet
        self.answerString = answers
        
        self.totalQuantity = wordSet.count
        
        self.status = .going
    }
    
    // first view
    func start() {
        wordTitle.text = wordSet[0]
        
        for iterator in 0...3 {
            answerButtons[iterator].setTitle(answerString[currentIndex][iterator], for: .normal)
        }
        
        currentIndex += 1
    }
    
    
    // next move
    func next() {
        
        if (currentIndex) == totalQuantity {
            self.status = .ended
            print("ended")
            
        } else {
            wordTitle.text = wordSet[currentIndex]
            for iterator in 0...3 {
                answerButtons[iterator].setTitle(answerString[currentIndex][iterator], for: .normal)
            }
            
            currentIndex += 1

        }
    }
}
