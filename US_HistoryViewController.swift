//
//  US_HistoryViewController.swift
//  Quiz
//
//  Created by Keertika on 3/13/18.
//  Copyright © 2018 DePaul University. All rights reserved.
//

import UIKit

class US_HistoryViewController: UIViewController {

    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var answer_1: UIButton!
    
    @IBOutlet weak var answer_2: UIButton!
    
    @IBOutlet weak var answer_3: UIButton!
    
    @IBOutlet weak var answer_4: UIButton!
    
    @IBOutlet weak var next_button: UIButton!
    
    @IBOutlet weak var feedbackText: UILabel!
    
    
    
    @IBAction func nextQuestion(_ sender: Any) {
        if (true == quizEnded) {
            startQuiz()
        } else {
            nextQuestion()
        }
        
        feedbackText.textColor = UIColor.white
        feedbackText.backgroundColor = UIColor.black
        feedbackText.text = "Test your knowledge about American History!"
    }
    
    var questions : [Question]!
    var currentQuestion = 0
    var quizEnded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestions()
        startQuiz()
    }
    
    func loadQuestions() -> Void {
        let question1 = Question(
            question: "How many colonies was the United States originally? ",
            answers: [
                Answer(answer: "11", isRight: false),
                Answer(answer: "12", isRight: false),
                Answer(answer: "13", isRight: true),
                Answer(answer: "14", isRight: false)])
        
        let question2 = Question(
            question: "What war was fought on American soil from 1861 to 1865?",
            answers: [
                Answer(answer: "War of 1812", isRight: false),
                Answer(answer: "World War I", isRight: false),
                Answer(answer: "The Revolutionary War", isRight: false),
                Answer(answer: "The American Civil War", isRight: true)])
        
        let question3 = Question(
            question: "Who was the 16th president of the US?",
            answers: [
                Answer(answer: "Abraham Lincoln", isRight: true),
                Answer(answer: "Ulysses S. Grant", isRight: false),
                Answer(answer: "James Buchanan", isRight: false),
                Answer(answer: "Andrew Johnson", isRight: false)])
        
        let question4 = Question(
            question: "How many judges are there in the United States Surpreme Court?",
            answers: [
                Answer(answer: "5", isRight: false),
                Answer(answer: "7", isRight: false),
                Answer(answer: "9", isRight: true),
                Answer(answer: "11", isRight: false)])
        
        let question5 = Question(
            question: "Who was the president from 1933 to 1945,the only president to serve more than 8 years in office?",
            answers: [
                Answer(answer: "Harry Truman", isRight: false),
                Answer(answer: "Franklin D. Roosevelt", isRight: true),
                Answer(answer: "Herbert Hoover", isRight: false),
                Answer(answer: "Dwight Eisenhower", isRight: false)])
        
        let question6 = Question(
            question: "How many Senators are in the US congress?",
            answers: [
                Answer(answer: "50", isRight: false),
                Answer(answer: "100", isRight: true),
                Answer(answer: "150", isRight: false),
                Answer(answer: "200", isRight: false)])
        
        let question7 = Question(
            question: "Who was the first President of the United States?",
            answers: [
                Answer(answer: "John Adams", isRight: false),
                Answer(answer: "George Washington", isRight: true),
                Answer(answer: "Andrew Jackson", isRight: false),
                Answer(answer: "Thomas Jefferson", isRight: false)])
        
        let question8 = Question(
            question: "In the United States government there are two major political parties. The Republicians and?",
            answers: [
                Answer(answer: "The Independants", isRight: false),
                Answer(answer: "The Progressives", isRight: false),
                Answer(answer: "The Federalists", isRight: false),
                Answer(answer: "The Democrats", isRight: true)])
        
        let question9 = Question(
            question: "Who was the only president to serve two separate terms in office?",
            answers: [
                Answer(answer: "Benjamin Harrison", isRight: false),
                Answer(answer: "William McKinley", isRight: false),
                Answer(answer: "Grover Cleveland", isRight: true),
                Answer(answer: "Chester A. Arthur", isRight: false)])
        
        let question10 = Question(
            question: "Name of the U.S. surveillance ship that was attacked by North Vietnam in the Gulf of Tonkin?",
            answers: [
                Answer(answer: "USS Maddox", isRight: true),
                Answer(answer: "USS Banner", isRight: false),
                Answer(answer: "USS Kennedy", isRight: false),
                Answer(answer: "USS Liberty", isRight: false)])
        
        
        self.questions = [
            question1,
            question2,
            question3,
            question4,
            question5,
            question6,
            question7,
            question8,
            question9,
            question10
            
        ]
    }
    
    
    @IBAction func answer1_selected(_ sender: UIButton) {
        selectAnswer(0)
    }
    
    
    @IBAction func answer2_selected(_ sender: UIButton) {
        selectAnswer(1)
    }
    
    
    @IBAction func answer3_selected(_ sender: UIButton) {
        selectAnswer(2)
    }
    
    
    @IBAction func answer4_selected(_ sender: UIButton) {
        selectAnswer(3)
    }
    
    func startQuiz() -> Void {
        
        feedbackText.textColor = UIColor.white
        feedbackText.backgroundColor = UIColor.black
        feedbackText.text = "Test your knowledge about American History!"
        answer_1.isHidden = false
        answer_2.isHidden = false
        answer_3.isHidden = false
        answer_4.isHidden = false
        question.isHidden = false
        
        questions.shuffle()
        
        for i in 0 ..< questions.count {
            questions[i].answers.shuffle()
        }
        
        quizEnded = false
        next_button.setTitle("Next", for: UIControlState())
        currentQuestion = 0
        next_button.isHidden = true
        
        showQuestion(0)
    }
    
    func showQuestion(_ questionId : Int) -> Void {
        enableButtons()
        next_button.isHidden = true
        
        let selectedQuestion : Question = questions[questionId]
        question.text = selectedQuestion.question
        
        answer_1?.setTitle(selectedQuestion.answers[0].response, for: UIControlState())
        answer_2?.setTitle(selectedQuestion.answers[1].response, for: UIControlState())
        answer_3?.setTitle(selectedQuestion.answers[2].response, for: UIControlState())
        answer_4?.setTitle(selectedQuestion.answers[3].response, for: UIControlState())
    }
    
    func disableButtons() -> Void {
        answer_1.isEnabled = false
        answer_2.isEnabled = false
        answer_3.isEnabled = false
        answer_4.isEnabled = false
    }
    
    func enableButtons() -> Void {
        answer_1.isEnabled = true
        answer_2.isEnabled = true
        answer_3.isEnabled = true
        answer_4.isEnabled = true
    }
    
    func selectAnswer(_ answerId : Int) -> Void {
        disableButtons()
        let answer : Answer = questions[currentQuestion].answers[answerId]
        
        if (true == answer.isRight) {
            feedbackText.text = "Correct Answer!"
            feedbackText.textColor = UIColor.white
            feedbackText.backgroundColor = UIColor.green
        } else {
            feedbackText.text = "Incorrect Answer!"
            feedbackText.textColor = UIColor.white
            feedbackText.backgroundColor = UIColor.red
        }
        
        next_button.isHidden = false
        
    }
    
    
    func nextQuestion() {
        currentQuestion += 1
        
        if (currentQuestion < questions.count) {
            showQuestion(currentQuestion)
        } else {
            endQuiz()
        }
        
        
    }
    

    func endQuiz() {
        quizEnded = true
        feedbackText.textColor = UIColor.black
        next_button.setTitle("Start Again!", for: UIControlState())
        answer_1.isHidden = true
        answer_2.isHidden = true
        answer_3.isHidden = true
        answer_4.isHidden = true
        question.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
