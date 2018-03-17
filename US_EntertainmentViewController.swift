//
//  US_EntertainmentViewController.swift
//  Quiz
//
//  Created by Keertika on 3/13/18.
//  Copyright © 2018 DePaul University. All rights reserved.
//

import UIKit

class US_EntertainmentViewController: UIViewController {

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
            question: "In 'The Mighty Ducks', which character is given the nickname 'Cake Eater'?",
            answers: [
                Answer(answer: "Fulton Reed", isRight: false),
                Answer(answer: "Adam Banks", isRight: true),
                Answer(answer: "Les Averman", isRight: false),
                Answer(answer: "Greg Goldberg", isRight: false)])
        
        
        let question2 = Question(
            question: "Who saves Kevin from the robbers at the end of 'Home Alone'?",
            answers: [
                Answer(answer: "Buzz", isRight: false),
                Answer(answer: "The Police", isRight: false),
                Answer(answer: "Dr. Stevens", isRight: false),
                Answer(answer: "Old Man Marley", isRight: true)])
        
        
        let question3 = Question(
            question: "In 'Mac and Me', what does the name 'Mac' stand for?",
            answers: [
                Answer(answer: "Messy Alien Critter", isRight: false),
                Answer(answer: "Mysterious Alien Creature", isRight: true),
                Answer(answer: "Massive Alien Creation", isRight: false),
                Answer(answer: "Mutated Alien Crab", isRight: false)])
        
        
        let question4 = Question(
            question: "In 'Explorers', what do the characters name the spaceship that they build?",
            answers: [
                Answer(answer: "Country Road", isRight: false),
                Answer(answer: "Lightning Road", isRight: false),
                Answer(answer: "Fire Road", isRight: false),
                Answer(answer: "Thunder Road", isRight: true)])
        
        
        let question5 = Question(
            question: "At the end of 'Now & Then', the girls play which game?",
            answers: [
                Answer(answer: "Scrabble", isRight: false),
                Answer(answer: "Truth or Dare", isRight: true),
                Answer(answer: "Trivial Pursuit", isRight: false),
                Answer(answer: "Poker", isRight: false)])
        
        
        let question6 = Question(
            question: "Who has lost two Oscars to Hilary Swank?",
            answers: [
                Answer(answer: "Meryl Streep", isRight: false),
                Answer(answer: "Andie MacDowell", isRight: false),
                Answer(answer: "Annette Bening", isRight: true),
                Answer(answer: "Kate Winslet", isRight: false)])
        
        
        let question7 = Question(
            question: "Three of these films got five acting nominations. Which, with a mere four, is the odd one out?",
            answers: [
                Answer(answer: "Tom Jones(1963)", isRight: false),
                Answer(answer: "Bonnie and Clyde(1967)", isRight: false),
                Answer(answer: "Reds(1981)", isRight: true),
                Answer(answer: "All About Eve(1950)", isRight: false)])
        
        
        let question8 = Question(
            question: "Who is the only actress to win an Oscar for playing someone born a man?",
            answers: [
                Answer(answer: "Felicity Huffman", isRight: false),
                Answer(answer: "Linda Hunt", isRight: true),
                Answer(answer: "Cate Blanchett", isRight: false),
                Answer(answer: "Hilary Swank", isRight: false)])
        
        
        let question9 = Question(
            question: "How many wholly animated films have ever been nominated for Best Picture?",
            answers: [
                Answer(answer: "1", isRight: false),
                Answer(answer: "2", isRight: false),
                Answer(answer: "3", isRight: true),
                Answer(answer: "4", isRight: false)])
        
        
        let question10 = Question(
            question: "Which country has won Oscar for Best Foreign Film the most often?",
            answers: [
                Answer(answer: "Sweden", isRight: false),
                Answer(answer: "Japan", isRight: false),
                Answer(answer: "Italy", isRight: true),
                Answer(answer: "France", isRight: false)])
        
        
        
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
