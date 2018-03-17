//
//  US_GeneralKnowledgeViewController.swift
//  Quiz
//
//  Created by Keertika on 3/13/18.
//  Copyright © 2018 DePaul University. All rights reserved.
//

import UIKit

class US_GeneralKnowledgeViewController: UIViewController {

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
        feedbackText.text = "Test your General Knowledge!"
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
            question: "The USA is a federal union of how many independent states?",
            answers: [
                Answer(answer: "40", isRight: false),
                Answer(answer: "50", isRight: true),
                Answer(answer: "60", isRight: false),
                Answer(answer: "100", isRight: false)])
        
        let question2 = Question(
            question: "The most recent state to join the union was?",
            answers: [
                Answer(answer: "Hawaii", isRight: true),
                Answer(answer: "Alaska", isRight: false),
                Answer(answer: "Puerto Rico", isRight: false),
                Answer(answer: "Canada", isRight: false)])
        
        let question3 = Question(
            question: "Most of the population of the mainland USA lives?",
            answers: [
                Answer(answer: "On the east coast", isRight: false),
                Answer(answer: "On the west coast", isRight: false),
                Answer(answer: "In the centre", isRight: false),
                Answer(answer: "On the east and west coasts", isRight: true)])
        
        let question4 = Question(
            question: "The longest river in the USA is the?",
            answers: [
                Answer(answer: "Missouri", isRight: false),
                Answer(answer: "Mississippi", isRight: true),
                Answer(answer: "Rio Grande", isRight: false),
                Answer(answer: "Yukon", isRight: false)])
        
        let question5 = Question(
            question: "Which is the biggest state in the USA? ",
            answers: [
                Answer(answer: "California", isRight: false),
                Answer(answer: "Texas", isRight: false),
                Answer(answer: "Arizona", isRight: false),
                Answer(answer: "Alaska", isRight: true)])
        
        let question6 = Question(
            question: "Manhattan was bought from Indians by?",
            answers: [
                Answer(answer: "Netherlands", isRight: true),
                Answer(answer: "France", isRight: false),
                Answer(answer: "Britain", isRight: false),
                Answer(answer: "Spain", isRight: false)])
        
        let question7 = Question(
            question: "The Mt. Rushmore Monument is in which state?",
            answers: [
                Answer(answer: "South Dakota", isRight: true),
                Answer(answer: "Iowa", isRight: false),
                Answer(answer: "Nevada", isRight: false),
                Answer(answer: "Wyoming", isRight: false)])
        
        let question8 = Question(
            question: "The three biggest cities of the USA are?",
            answers: [
                Answer(answer: "New York,LA,Houston", isRight: false),
                Answer(answer: "New York,LA,Chicago", isRight: true),
                Answer(answer: "New York,LA,Philadelphia", isRight: false),
                Answer(answer: "New York,Chicago,Philadelphia", isRight: false)])
        
        let question9 = Question(
            question: "In the USA the laws are?",
            answers: [
                Answer(answer: "The same in all states", isRight: false),
                Answer(answer: "Different in every state", isRight: true),
                Answer(answer: "Different in richer states", isRight: false),
                Answer(answer: "None of these", isRight: false)])
        
        let question10 = Question(
            question: "The President of the USA lives in?",
            answers: [
                Answer(answer: "White House Road", isRight: false),
                Answer(answer: "Pennsylvania Avenue", isRight: true),
                Answer(answer: "Texas Street", isRight: false),
                Answer(answer: "Washington Square", isRight: false)])
        
        
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
        feedbackText.text = "Test your General Knowledge!"
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
