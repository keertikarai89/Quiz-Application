//
//  India_EntertainmentViewController.swift
//  Quiz
//
//  Created by Keertika on 3/13/18.
//  Copyright © 2018 DePaul University. All rights reserved.
//

import UIKit

class India_EntertainmentViewController: UIViewController {

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
        feedbackText.text = "Test your knowledge about Movies and more!"
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
            question: "Which of these is NOT an Amitabh Bachchan movie?",
            answers: [
                Answer(answer: "Khuda Gawah", isRight: false),
                Answer(answer: "Sholay", isRight: false),
                Answer(answer: "Baazigar", isRight: true),
                Answer(answer: "Mr Natwarlal", isRight: false)
            ])
        
        let question2 = Question(
            question: "This movie was nominated for the Best Foreign Film at the Oscars (in 2001)! Name this movie.",
            answers: [
                Answer(answer: "Lagaan", isRight: true),
                Answer(answer: "Newton", isRight: false),
                Answer(answer: "Devdas", isRight: false),
                Answer(answer: "Sholay", isRight: false),])
        
        let question3 = Question(
            question: "First Indian movie submitted for Oscar?",
            answers: [
                Answer(answer: "The Guide", isRight: false),
                Answer(answer: "Mother India", isRight: true),
                Answer(answer: "Madhumati", isRight: false),
                Answer(answer: "Amrapali", isRight: false),])
        
        let question4 = Question(
            question: "Filmfare awards started from the year?",
            answers: [
                Answer(answer: "1952", isRight: false),
                Answer(answer: "1964", isRight: false),
                Answer(answer: "1954", isRight: true),
                Answer(answer: "1960", isRight: false),])
        
        let question5 = Question(
            question: "First filmfare award for Best Actor awarded to?",
            answers: [
                Answer(answer: "Ashok Kumar", isRight: false),
                Answer(answer: "Dilip Kumar", isRight: true),
                Answer(answer: "Raj Kapoor", isRight: false),
                Answer(answer: "None of these", isRight: false),])
        
        let question6 = Question(
            question: "Film and television institute of India located at?",
            answers: [
                Answer(answer: "Mumbai", isRight: false),
                Answer(answer: "Kolkata", isRight: false),
                Answer(answer: "Pune", isRight: true),
                Answer(answer: "Delhi", isRight: false),])
        
        let question7 = Question(
            question: "First 3D animated film from India is?",
            answers: [
                Answer(answer: "Roadside Romeo", isRight: true),
                Answer(answer: "Ghayab Aaya", isRight: false),
                Answer(answer: "Hanuman", isRight: false),
                Answer(answer: "Bal Ganesh", isRight: false),])
        
        let question8 = Question(
            question: "Doordarshan founded in India in the year?",
            answers: [
                Answer(answer: "1962", isRight: false),
                Answer(answer: "1965", isRight: false),
                Answer(answer: "1952", isRight: false),
                Answer(answer: "1959", isRight: true),])
        
        let question9 = Question(
            question: "Anupam Kher's real age when he played a 65-year-old retired principal in Saaransh was?",
            answers: [
                Answer(answer: "28", isRight: true),
                Answer(answer: "29", isRight: false),
                Answer(answer: "42", isRight: false),
                Answer(answer: "43", isRight: false),])
        
        let question10 = Question(
            question: "Tabu's real name is?",
            answers: [
                Answer(answer: "Taslim Khan", isRight: false),
                Answer(answer: "Tabakul", isRight: false),
                Answer(answer: "Shakeela Merchant", isRight: false),
                Answer(answer: "Tabassum Fatima Hashmi", isRight: true),])
        
        
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
        feedbackText.text = "Test your knowledge about Movies and more!"
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
        next_button.isHidden = true
        currentQuestion = 0
        
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

