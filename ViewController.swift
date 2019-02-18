//  Waleed Khan

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var currentQuestion : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        questionLabel.text = allQuestions.list[currentQuestion].questionText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if(sender.tag == 1){
            pickedAnswer = true
        }
        else if(sender.tag == 2){
            pickedAnswer = false
        }
        checkAnswer()
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(currentQuestion + 1) / 13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat (currentQuestion+1)
    }
    

    func nextQuestion() {
        print(currentQuestion)
        if(currentQuestion == allQuestions.list.count){
            currentQuestion = 0
            let alert = UIAlertController(title: "Finished!", message: "Would you like to play again?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        else{
            questionLabel.text = allQuestions.list[currentQuestion].questionText
            updateUI()
        }
        
        
    }
    
    func checkAnswer() {
        if(pickedAnswer == allQuestions.list[currentQuestion].answer){
            print("YOU GOT IT")
            ProgressHUD.showSuccess("Correct!")
            score += 1
            updateUI()
            currentQuestion = currentQuestion + 1
            nextQuestion()
        }
        else{
            print("WRONG")
            ProgressHUD.showError("Wrong!")
            currentQuestion = currentQuestion + 1
            nextQuestion()
        }
    }
    
    func startOver() {
        nextQuestion()
        score = 0
        updateUI()
    }
    
}
