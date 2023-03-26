import UIKit
import InstantSearchVoiceOverlay

class SoundTestViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var canvasBackground: UIView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var wordBackground: UIView!
    let voiceOverlay = VoiceOverlayController()
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        voiceOverlay.delegate = self
        
        voiceOverlay.settings.showResultScreen = false
        voiceOverlay.settings.layout.inputScreen.backgroundColor = .clear
        
        voiceOverlay.settings.layout.resultScreen.subtitle = ""
        voiceOverlay.settings.layout.resultScreen.startAgainText = ""
        voiceOverlay.settings.layout.resultScreen.title = ""
        voiceOverlay.settings.layout.resultScreen.titleProcessed = ""
        
        voiceOverlay.settings.layout.resultScreen.textColor = .clear
        
        voiceOverlay.settings.layout.inputScreen.textColor = .clear
        voiceOverlay.settings.layout.inputScreen.errorHint = ""
        voiceOverlay.settings.layout.inputScreen.titleListening = ""
        voiceOverlay.settings.layout.inputScreen.titleInProgress = ""
        voiceOverlay.settings.layout.inputScreen.titleInitial = ""
        
        canvasBackground.layer.cornerRadius = 12.0
        label.layer.cornerRadius = 12.0
        wordBackground.layer.cornerRadius = 12
        playButton.layer.cornerRadius = 12
        
        wordBackground.clipsToBounds = true
        canvasBackground.clipsToBounds = true
        label.clipsToBounds = true
        playButton.clipsToBounds = true
        
        resultLabel.text = ""
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPlay(_ sender: UIButton) {
        voiceOverlay.start(on: self, textHandler: {text, final, _ in
            if final {
                print(text)
                self.resultLabel.text = text
                
            } else {
                print("in progress \(text)")
                self.resultLabel.text = text
                self.clearHighlight()
            }
        }, errorHandler: {error in
            
        })
    }
    
    @IBAction func onBackButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func check() {
        if (resultLabel.text == label.text) || (resultLabel.text!.lowercased() == label.text) {
            print("OKAY")
            highLightRightAnswer()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
                self.next()
            }
            
            
        } else {
            print("not okay")
            highLightFalseAnswer()
        }
    }
    
    func highLightRightAnswer(){
        resultLabel.textColor = .green
    }
    
    func highLightFalseAnswer(){
        resultLabel.textColor = .red
    }
    
    func clearHighlight(){
        resultLabel.textColor = .black
    }
    
    func next() {
        clearHighlight()
        
        label.text = "common sense"
        resultLabel.text = ""
        
        counterLabel.text = "6 / 12"
    }
    
}

extension SoundTestViewController: VoiceOverlayDelegate {
    
    func recording(text: String?, final: Bool?, error: Error?) {
       //  print("rec\(text)" ?? "none")
        if final! {
            check()
        }
    }
    
    
    
}
