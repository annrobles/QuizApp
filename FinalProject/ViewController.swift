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

    @IBOutlet weak var recycleTextInfoLabel: UILabel!
    
    @IBAction func letsPlayClicked(_ sender: Any) {
        let randomInt = Int.random(in: 0..<5)
        
        if let questionViewController = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController {
            self.navigationController?.pushViewController(questionViewController, animated: true)
            
            questionViewController.questionNum = 1
            questionViewController.currentQuestion = questions[randomInt]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questions = question.getQuestions()
        
        recycleTextInfoLabel?.numberOfLines = 0

    }

}

