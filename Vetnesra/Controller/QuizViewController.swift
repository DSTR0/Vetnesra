//
//  QuizViewController.swift
//  Vetnesra
//
//  Created by 1234 on 13.09.2022.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quiz = Quiz()

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBAction func closeButtonPressedd(_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        //TO DO
        // make some condition to check
        // that we are not out of range
        //the last question with
            quiz.checkAnswer(userAnswer: sender.currentTitle ?? "Nothing")
            quiz.currentQuestionNumber += 1
            updateUI()

        
    }
    
    func updateUI(){
        
        if quiz.currentQuestionNumber < quiz.question.count{
            questionLabel.text = quiz.getQuestionText()
            answerButton1.setTitle(quiz.getAnswer1(), for: .normal)
            answerButton2.setTitle(quiz.getAnswer2(), for: .normal)
            progressBar.progress = quiz.getProgress()
        }else{
            questionLabel.text = "It was the last question, you score \(quiz.getScore())%"
            answerButton1.alpha = 0
            answerButton2.alpha = 0
            closeButton.alpha = 1
            progressBar.progress = quiz.getProgress()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
