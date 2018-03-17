//
//  QuestionViewController.swift
//  Quiz
//
//  Created by Keertika on 3/6/18.
//  Copyright © 2018 DePaul University. All rights reserved.
//

import UIKit

class India_SportsViewController: UIViewController {

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
        feedbackText.text = "Test your knowledge about Sports!"
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
            question: "When India won the first Cricket World Cup?",
            answers: [
                Answer(answer: "1983", isRight: true),
                Answer(answer: "1979", isRight: false),
                Answer(answer: "1987", isRight: false),
                Answer(answer: "1991", isRight: false)
            ])
        
        let question2 = Question(
            question: "Who among the following is known as Flying Sikh of India?",
            answers: [
                Answer(answer: "Kapil Dev", isRight: false),
                Answer(answer: "PT Usha", isRight: false),
                Answer(answer: "Milkha Singh", isRight: true),
                Answer(answer: "Joginder Singh", isRight: false),])
        
        let question3 = Question(
            question: "Who is the first recipient of Rajiv Gandhi Khel Ratna Award?",
            answers: [
                Answer(answer: "Sunil Gavaskar", isRight: false),
                Answer(answer: "Sachin Tendulkar", isRight: false),
                Answer(answer: "Milkha Singh", isRight: false),
                Answer(answer: "Vishwanathan Anand", isRight: true),])
        
        let question4 = Question(
            question: "Who won the gold medal in 2010 Commonwealth games in 55kg woman wrestling?",
            answers: [
                Answer(answer: "Pooja Dhanda", isRight: false),
                Answer(answer: "Geeta Phogat", isRight: true),
                Answer(answer: "Ambika Guha", isRight: false),
                Answer(answer: "Sonika Kaliraman", isRight: false),])
        
        let question5 = Question(
            question: "Which Indian cricketer scored the highest runs in an Innings in the Twenty20 World Cup?",
            answers: [
                Answer(answer: "Yuvraj Singh", isRight: false),
                Answer(answer: "Robin Uthappa", isRight: false),
                Answer(answer: "Gautam Gambhir", isRight: true),
                Answer(answer: "Virender Sehwag", isRight: false),])
        
        let question6 = Question(
            question: "Which Indian bowler had the best figures in the  ICC World Twenty20?",
            answers: [
                Answer(answer: "S.Sreesanth", isRight: false),
                Answer(answer: "Joginder Sharma", isRight: false),
                Answer(answer: "R.P.Singh", isRight: true),
                Answer(answer: "Irfan Pathan", isRight: false),])
        
        let question7 = Question(
            question: "Which animal represent in the mascot in Delhi Asian Games, 1982?",
            answers: [
                Answer(answer: "A tiger", isRight: false),
                Answer(answer: "An elephant", isRight: true),
                Answer(answer: "A lion", isRight: false),
                Answer(answer: "A Panda", isRight: false),])
        
        let question8 = Question(
            question: "Who amaong the following in known as Payyoli Express?",
            answers: [
                Answer(answer: "Shiny Abraham", isRight: false),
                Answer(answer: "PT Usha", isRight: true),
                Answer(answer: "Jyotirmoyee Sikdar", isRight: false),
                Answer(answer: "KM Beenamol", isRight: false),])
        
        let question9 = Question(
            question: "Who is the only and first indian player to compete six Olympic Games?",
            answers: [
                Answer(answer: "Karni Singh", isRight: false),
                Answer(answer: "Randhir Singh", isRight: false),
                Answer(answer: "Leander Paes", isRight: true),
                Answer(answer: "Mahesh Bhupati", isRight: false),])
        
        let question10 = Question(
            question: "2010 Commonwealth Games held in?",
            answers: [
                Answer(answer: "Canada", isRight: false),
                Answer(answer: "India", isRight: true),
                Answer(answer: "Britian", isRight: false),
                Answer(answer: "Malaysia", isRight: false),])
        
        
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
        feedbackText.text = "Test your knowledge about Sports!"
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

