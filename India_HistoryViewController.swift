//
//  India_HistoryViewController.swift
//  Quiz
//
//  Created by Keertika on 3/13/18.
//  Copyright © 2018 DePaul University. All rights reserved.
//

import UIKit

class India_HistoryViewController: UIViewController {

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
        feedbackText.text = "Test your knowledge about Indian History!"
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
            question: "Indian Navy Act was passed on?",
            answers: [
                Answer(answer: "1921", isRight: false),
                Answer(answer: "1925", isRight: false),
                Answer(answer: "1927", isRight: true),
                Answer(answer: "1930", isRight: false)
            ])
        
        let question2 = Question(
            question: "The first to establish regular trade with India was?",
            answers: [
                Answer(answer: "Dutch", isRight: false),
                Answer(answer: "Portuguese", isRight: true),
                Answer(answer: "French", isRight: false),
                Answer(answer: "English", isRight: false),])
        
        let question3 = Question(
            question: "The Indus Valley houses were built of?",
            answers: [
                Answer(answer: "Bamboos", isRight: false),
                Answer(answer: "Wood", isRight: false),
                Answer(answer: "Bricks", isRight: true),
                Answer(answer: "Stone", isRight: true),])
        
        let question4 = Question(
            question: "The last Mughal Emperor was?",
            answers: [
                Answer(answer: "Akbar", isRight: false),
                Answer(answer: "Babur", isRight: false),
                Answer(answer: "Noor Jehan", isRight: false),
                Answer(answer: "Bahadur Shah", isRight: true),])
        
        let question5 = Question(
            question: "The first wave of Aryan immigration into India began in?",
            answers: [
                Answer(answer: "500 BC", isRight: false),
                Answer(answer: "1000 BC", isRight: false),
                Answer(answer: "1500 BC", isRight: true),
                Answer(answer: "1000 A.D.", isRight: false),])
        
        let question6 = Question(
            question: "Chanakya was known as?",
            answers: [
                Answer(answer: "Rajasekhara", isRight: false),
                Answer(answer: "Bhattasvamin", isRight: false),
                Answer(answer: "Vishnugupta", isRight: true),
                Answer(answer: "Visakhadatta", isRight: false),])
        
        let question7 = Question(
            question: "The first to start a joint stock company to trade with India were the?",
            answers: [
                Answer(answer: "French", isRight: false),
                Answer(answer: "Dutch", isRight: true),
                Answer(answer: "Portuguese", isRight: false),
                Answer(answer: "Danish", isRight: false),])
        
        let question8 = Question(
            question: "The capital of the kingdom of Maharaja Ranjit Singh was?",
            answers: [
                Answer(answer: "Lahore", isRight: true),
                Answer(answer: "Amrister", isRight: false),
                Answer(answer: "Patiala", isRight: false),
                Answer(answer: "None of these", isRight: false),])
        
        let question9 = Question(
            question: "India derives its name from?",
            answers: [
                Answer(answer: "The Hindus", isRight: false),
                Answer(answer: "Lord Indra", isRight: false),
                Answer(answer: "The Aryans", isRight: false),
                Answer(answer: "The River Indus", isRight: true),])
        
        let question10 = Question(
            question: "Sea route in India was discovered by?",
            answers: [
                Answer(answer: "Columbus", isRight: false),
                Answer(answer: "Amundsen", isRight: false),
                Answer(answer: "Vasco–da–gama", isRight: true),
                Answer(answer: "None of these", isRight: false),])
        
        
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
        feedbackText.text = "Test your knowledge about Indian History!"
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

