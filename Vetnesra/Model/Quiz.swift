//
//  Quiz.swift
//  Vetnesra
//
//  Created by 1234 on 13.09.2022.
//

import Foundation

struct Quiz {
    
    let question: [Question] = [Question(text: "How much you pay per year(gross)?", answer1: "<65k", answer2: ">65k", rightAnswer: ">65k"), Question(text: "Do you think about furhter development of your employers?", answer1: "Yes", answer2: "No", rightAnswer: "Yes")]
    var currentQuestionNumber: Int = 0
    var rightAnswersCounter: Int = 0
    
    func getQuestionText() -> String{
        
        return question[currentQuestionNumber].text
        
    }
    
    func getAnswer1() -> String{
        
        return question[currentQuestionNumber].answer1
        
    }
    
    func getAnswer2() -> String{
        
        return question[currentQuestionNumber].answer2
        
    }
    
    func getProgress() -> Float{
        
        return Float(currentQuestionNumber + 1)/Float(question.count)
        
    }
    
    mutating func checkAnswer(userAnswer: String){
        
        if userAnswer == self.question[currentQuestionNumber].rightAnswer{
            rightAnswersCounter += 1
        }
        
    }
    
    func getScore() -> String{
        
        return String(format: "%.2f", (Float(rightAnswersCounter)/Float(question.count))*100.0)
        
    }
    
    
}
