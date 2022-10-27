//
//  ViewController.swift
//  FinalProject
//
//  Created by Ann Robles on 10/24/22.
//

import UIKit

class ViewController: UIViewController {
    let question = Question()
    var questions = [Question]()
    var questionsDone = [Int]()
    var qIndeces = [0, 1, 2, 3, 4, 5]
    
    @IBOutlet weak var recycleTextInfoLabel: UILabel!
    
    @IBAction func letsPlayClicked(_ sender: Any) {
        let qIndeces = qIndeces.shuffled()
        
        if let questionViewController = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController {
            self.navigationController?.pushViewController(questionViewController, animated: true)
            
            questionViewController.questionNum = 1
            questionViewController.currentQuestion = questions[qIndeces[0]]
            questionViewController.questions = questions
            questionViewController.qIndeces = qIndeces
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questions = question.getQuestions()
        
        recycleTextInfoLabel?.numberOfLines = 0

    }

}

