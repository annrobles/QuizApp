//
//  QuestionViewController.swift
//  FinalProject
//
//  Created by Ann Robles on 10/25/22.
//

import UIKit

class QuestionViewController: ViewController {
    
    var score = 0
    var questionNum = 0
    var selectedOption: Int?
    var selectedOptions:[Int] = []
    var currentQuestion = Question()
    let letterChoices = ["A", "B", "C", "D"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var recyclingInfoLabel: UILabel!
    @IBOutlet weak var progressViewLabel: UILabel!
    @IBOutlet weak var questionUIImage: UIImageView!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var okBtn: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var questionUIImageHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    @IBAction func okClicked(_ sender: Any) {
        var remark = ""
        let remarksWhenAnswerCorrect = ["Bingo!", "Nailed it.", "Correct!"].shuffled()
        let remarksWhenAnswerWrong = ["Wrong!", "Not quite.", "Nope."].shuffled()
        
        okBtn.isEnabled = false
        continueBtn.isHidden = false
        
        if let selectedOption = selectedOption {
            selectedOptions.append(selectedOption)
            
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
        
        tableView.reloadData()
        
        if let selectedOption = selectedOption, let pos = UITableView.ScrollPosition(rawValue: 0) {
            let indexPath = IndexPath(row: selectedOption, section: 0)
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: pos)
        }
    }
    
    @IBAction func continueClicked(_ sender: Any) {
        let questionViewController = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController


        questionViewController?.qIndeces = qIndeces
        questionViewController?.score = score
        questionViewController?.questions = questions
        questionViewController?.selectedOptions = selectedOptions
        
        if let selectedOption = selectedOption {
            if currentQuestion.answer == Character(letterChoices[selectedOption]) {
                questionViewController?.score = score + 1
            }
        }
        
        if questionNum == 3 {
            showAlert(withTitle:"", withMessage: "Are you sure you want to submit?") {
                if let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
                    self.navigationController?.pushViewController(resultViewController, animated: true)
    
                    resultViewController.score = questionViewController!.score
                    resultViewController.qIndeces = self.qIndeces
                    resultViewController.questions = self.questions
                    resultViewController.selectedOptions = self.selectedOptions
                }
            }
            return
        }
        
        if questionViewController != nil {
            self.navigationController?.pushViewController(questionViewController!, animated: true)

            questionViewController?.questionNum = questionNum + 1
            questionViewController?.currentQuestion = questions[qIndeces[questionNum]]
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let questionNib = UINib(nibName: "QuestionTableViewCell", bundle: Bundle.main)
        tableView.register(questionNib, forCellReuseIdentifier: "QuestionTableViewCell")
        
        // Do any additional setup after loading the view.
        questionLabel?.text = "\(questionNum) - \(currentQuestion.questionText ?? "")"
        questionLabel?.numberOfLines = 0
        
        questionUIImage.image = currentQuestion.questionImage
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        continueBtn.isHidden = true
        
        recyclingInfoLabel?.numberOfLines = 0
        
        progressViewLabel?.text = "\(questionNum) of 3"
        progressView.setProgress(Float(Double(questionNum) * 0.33), animated: true)
        
        if currentQuestion.questionImage == nil {
            questionUIImageHeight.constant = 0
            tableViewHeight.constant = 430
        }
    
        if questionNum == 1 {
            navigationItem.hidesBackButton = true
        }
        
        if questionNum == 3 {
            continueBtn?.setTitle("Submit", for: .normal)
        }
        
    }

}

extension QuestionViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion.options?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as? QuestionTableViewCell
        
        cell?.optionLetterLabel?.text = letterChoices[indexPath.row]
        
        cell?.optionLabel?.text = currentQuestion.options?[indexPath.row]
        
        if currentQuestion.optionImage?[indexPath.row] == nil, cell?.optionImageHeight != nil {
            cell?.optionImageHeight.constant = 0
        }
        else {
            cell?.optionImage?.image = currentQuestion.optionImage?[indexPath.row]
        }
        
        if let selectedOption = selectedOption {
            cell?.isUserInteractionEnabled = false

            if selectedOption == indexPath.row {
                cell?.setSelected(true, animated: false)
                if currentQuestion.answer == Character(letterChoices[selectedOption]) {
                    cell?.answerIconImage?.image = UIImage(systemName: "checkmark")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
                }
                else {
                    cell?.answerIconImage?.image = UIImage(systemName: "xmark")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
                }
            }
            
            if currentQuestion.answer == Character(letterChoices[indexPath.row]) {
                cell?.answerIconImage?.image = UIImage(systemName: "checkmark")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
            }
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 8

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 5
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedOption = indexPath.row
    }

}
