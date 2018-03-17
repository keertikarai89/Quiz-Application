//
//  US_SportsViewController.swift
//  Quiz
//
//  Created by Keertika on 3/13/18.
//  Copyright © 2018 DePaul University. All rights reserved.
//

import UIKit

class US_SportsViewController: UIViewController {

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
            question: "Who has the most wins as a head coach in the NFL?",
            answers: [
                Answer(answer: "George Halas", isRight: false),
                Answer(answer: "Curly Lambeau", isRight: false),
                Answer(answer: "Tom Landry", isRight: false),
                Answer(answer: "Don Shula", isRight: true)])
        
        let question2 = Question(
            question: "Which NFL team features a helmet decal only on one side of the helmet?",
            answers: [
                Answer(answer: "Houston Texans", isRight: false),
                Answer(answer: "Jacksonville Jaguars", isRight: false),
                Answer(answer: "Pittsburgh Steelers", isRight: true),
                Answer(answer: "Tennessee Titans", isRight: false)])
        
        
        let question3 = Question(
            question: "How many Heisman Trophy winners have gone on to be MVP of the Super Bowl?",
            answers: [
                Answer(answer: "2", isRight: false),
                Answer(answer: "3", isRight: false),
                Answer(answer: "4", isRight: true),
                Answer(answer: "5", isRight: false)])
        
        
        let question4 = Question(
            question: "How many points does a team score for a touchdown in American Football?",
            answers: [
                Answer(answer: "4", isRight: false),
                Answer(answer: "3", isRight: false),
                Answer(answer: "6", isRight: true),
                Answer(answer: "5", isRight: false)])
        
        
        let question5 = Question(
            question: "How many undefeated fights had Mike Tyson before losing he's first fight?",
            answers: [
                Answer(answer: "37", isRight: true),
                Answer(answer: "35", isRight: false),
                Answer(answer: "41", isRight: false),
                Answer(answer: "39", isRight: false)])
        
        
        let question6 = Question(
            question: "How many American football teams compete in the NFL?",
            answers: [
                Answer(answer: "32", isRight: true),
                Answer(answer: "30", isRight: false),
                Answer(answer: "28", isRight: false),
                Answer(answer: "26", isRight: false)])
        
        
        let question7 = Question(
            question: "Who was the first person to defeat Mike Tyson?",
            answers: [
                Answer(answer: "Lennox Lewis", isRight: true),
                Answer(answer: "Evander Holyfield", isRight: false),
                Answer(answer: "James 'Buster' Douglas", isRight: false),
                Answer(answer: "Frank Bruno", isRight: false)])
        
        
        let question8 = Question(
            question: "Who was the first fighter to defeat Muhammad Ali?",
            answers: [
                Answer(answer: "Joe Frazier", isRight: true),
                Answer(answer: "Ken Norton", isRight: false),
                Answer(answer: "Leon Spinks", isRight: false),
                Answer(answer: "Ernie Terrell", isRight: false)])
        
        
        let question9 = Question(
            question: "What position is former Major League Baseball player, Rollie Fingers famous for playing?",
            answers: [
                Answer(answer: "Catcher", isRight: false),
                Answer(answer: "Pitcher", isRight: true),
                Answer(answer: "First Base", isRight: false),
                Answer(answer: "Third Base", isRight: false)])
        
        let question10 = Question(
            question: "As at 2010 how many majors has Tiger Woods won?",
            answers: [
                Answer(answer: "16", isRight: false),
                Answer(answer: "14", isRight: true),
                Answer(answer: "12", isRight: false),
                Answer(answer: "10", isRight: false)])
        
        
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
