//
//  India_GeneralKnowledgeViewController.swift
//  Quiz
//
//  Created by Keertika on 3/13/18.
//  Copyright © 2018 DePaul University. All rights reserved.
//

import UIKit

class India_GeneralKnowledgeViewController: UIViewController {

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
            question: "The words 'Satyameva Jayate' inscribed below the base plate of the emblem of India are taken from?",
            answers: [
                Answer(answer: "Rigveda", isRight: false),
                Answer(answer: "Satpath Brahmana", isRight: false),
                Answer(answer: "Mundak Upanishad", isRight: true),
                Answer(answer: "Ramayana", isRight: false)
            ])
        
        let question2 = Question(
            question: "The ratio of width of our National flag to its length is?",
            answers: [
                Answer(answer: "3:5", isRight: false),
                Answer(answer: "2:3", isRight: true),
                Answer(answer: "2:4", isRight: false),
                Answer(answer: "3:4", isRight: false),])
        
        let question3 = Question(
            question: "The Rath Yatra at Puri is celebrated in honour of which Hindu deity?",
            answers: [
                Answer(answer: "Ram", isRight: false),
                Answer(answer: "Jaganath", isRight: true),
                Answer(answer: "Shiva", isRight: false),
                Answer(answer: "Vishnu", isRight: false),])
        
        let question4 = Question(
            question: "The book of Parsis is?",
            answers: [
                Answer(answer: "Torah", isRight: false),
                Answer(answer: "Bible", isRight: false),
                Answer(answer: "Zend Avesta", isRight: true),
                Answer(answer: "Gita", isRight: false),])
        
        let question5 = Question(
            question: "The National Anthem was first sung in the year?",
            answers: [
                Answer(answer: "1911", isRight: true),
                Answer(answer: "1913", isRight: false),
                Answer(answer: "1936", isRight: false),
                Answer(answer: "1935", isRight: false),])
        
        let question6 = Question(
            question: "The last Mahakumbh of the 20th century was held at?",
            answers: [
                Answer(answer: "Nasik", isRight: false),
                Answer(answer: "Ujjain", isRight: false),
                Answer(answer: "Allahabad", isRight: false),
                Answer(answer: "Haridwar", isRight: true),])
        
        let question7 = Question(
            question: "The National Song of India was composed by?",
            answers: [
                Answer(answer: "Rabindranath Tagore", isRight: false),
                Answer(answer: "Bankim Chandra Chatterji", isRight: true),
                Answer(answer: "Iqbal", isRight: false),
                Answer(answer: "Jai Shankar Prasad", isRight: false),])
        
        let question8 = Question(
            question: "In which of the following festivals are boat races a special feature?",
            answers: [
                Answer(answer: "Onam", isRight: true),
                Answer(answer: "Rongali Bihu", isRight: false),
                Answer(answer: "Navratri", isRight: false),
                Answer(answer: "Pongal", isRight: false),])
        
        let question9 = Question(
            question: "Kalchakra ceremony is associated with which of the following ceremonies?",
            answers: [
                Answer(answer: "Hinduism", isRight: false),
                Answer(answer: "Buddhism", isRight: true),
                Answer(answer: "Jainism", isRight: false),
                Answer(answer: "Islam", isRight: false),])
        
        let question10 = Question(
            question: "The Central Rice Research Station is situated in?",
            answers: [
                Answer(answer: "Chennai", isRight: false),
                Answer(answer: "Cuttack", isRight: true),
                Answer(answer: "Bangalore", isRight: false),
                Answer(answer: "Quilon", isRight: false),])
        
        
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
        answer_1.isHidden = false
        answer_2.isHidden = false
        answer_3.isHidden = false
        answer_4.isHidden = false
        question.isHidden = false
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


