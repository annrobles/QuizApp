//
//  QuestionViewController.swift
//  FinalProject
//
//  Created by Ann Robles on 10/25/22.
//

import UIKit

class QuestionViewController: ViewController {
    
    var questionNum = 0
    var currentQuestion = Question()
    var selectedOption: Int?
    
    let letterChoices = ["A", "B", "C", "D"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var recyclingInfoLabel: UILabel!
    @IBOutlet weak var questionUIImage: UIImageView!
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet weak var questionUIImageHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    @IBAction func okClicked(_ sender: Any) {
        var remark = ""
        let remarksWhenAnswerCorrect = ["Bingo!", "Nailed it.", "Correct!"].shuffled()
        let remarksWhenAnswerWrong = ["Wrong!", "Not quite.", "Nope."].shuffled()
        
        if let selectedOption = selectedOption {
            if currentQuestion.answer == Character(letterChoices[selectedOption]) {
                remark = remarksWhenAnswerCorrect[0]
            }
            else {
                remark = remarksWhenAnswerWrong[0]
            }
        }
        else {
            remark = remarksWhenAnswerWrong[0]
        }
        
        let recyclingInfo = NSMutableAttributedString(string: remark, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: recyclingInfoLabel.font.pointSize)])
        let recyclingInfoTwo = NSMutableAttributedString(string: " \(currentQuestion.recyclingInfo ?? "")", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: recyclingInfoLabel.font.pointSize)])
        recyclingInfo.append(recyclingInfoTwo)
        recyclingInfoLabel?.attributedText = recyclingInfo
        
        continueBtn.isHidden = false
        
        //tableView.reloadData()
    }
    
    @IBAction func continueClicked(_ sender: Any) {
        let randomInt = Int.random(in: 0..<5)
        
        if questionNum == 3 {
            if let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
                self.navigationController?.pushViewController(resultViewController, animated: true)
                
            }
            return
        }
        
        if let questionViewController = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController {
            self.navigationController?.pushViewController(questionViewController, animated: true)
            
            questionViewController.currentQuestion = questions[randomInt]
            questionViewController.questionNum = questionNum + 1
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let questionNib = UINib(nibName: "QuestionTableViewCell", bundle: Bundle.main)
        tableView.register(questionNib, forCellReuseIdentifier: "QuestionTableViewCell")
        
        // Do any additional setup after loading the view.
        questionLabel?.text = "Q\(questionNum). \(currentQuestion.questionText ?? "")"
        questionLabel?.numberOfLines = 0
        
        questionUIImage.image = currentQuestion.questionImage
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        continueBtn.isHidden = true
        
        recyclingInfoLabel?.numberOfLines = 0
        
        if currentQuestion.questionImage == nil {
            questionUIImageHeight.constant = 0
            tableViewHeight.constant = 430
        }
    
        if questionNum == 1 {
            navigationItem.hidesBackButton = true
        }
        
    }

}

extension QuestionViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion.options?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as? QuestionTableViewCell
        
        if currentQuestion.optionImage?[indexPath.row] == nil, cell?.optionImageHeight != nil {
            cell?.optionImageHeight.constant = 0
        }
        else {
            cell?.optionImage?.image = currentQuestion.optionImage?[indexPath.row]
        }
        
        cell?.optionLetterLabel?.text = letterChoices[indexPath.row]
        
        cell?.optionLabel?.text = currentQuestion.options?[indexPath.row]
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 8

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 5   //if you want round edges
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedOption = indexPath.row
    }

}
