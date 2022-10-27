//
//  ResultTableViewCell.swift
//  FinalProject
//
//  Created by Ann Robles on 10/27/22.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    var question = Question()
    var selectedOption: Int?
    let letterChoices = ["A", "B", "C", "D"]
    
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var resultOptionTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let questionOptionNib = UINib(nibName: "QuestionTableViewCell", bundle: Bundle.main)
        resultOptionTableView.register(questionOptionNib, forCellReuseIdentifier: "QuestionTableViewCell")
        
        questionTextLabel?.numberOfLines = 0
        
        resultOptionTableView.delegate = self
        resultOptionTableView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ResultTableViewCell : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question.options?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as? QuestionTableViewCell
        
        cell?.optionLabel?.text = question.options?[indexPath.row]
        cell?.optionLabel?.font = cell?.optionLabel?.font.withSize(12)
        
        cell?.optionLetterLabel?.text = letterChoices[indexPath.row]
        cell?.optionLetterLabel?.font = cell?.optionLabel?.font.withSize(12)
        
        cell?.optionImage?.isHidden = true
        cell?.optionImageHeight.constant = 0
        
        if let selectedOption = selectedOption {
            cell?.isUserInteractionEnabled = false
            
            if selectedOption == indexPath.row {
                cell?.setSelected(true, animated: false)
                if question.answer == Character(letterChoices[selectedOption]) {
                    cell?.answerIconImage?.image = UIImage(systemName: "checkmark")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
                }
                else {
                    cell?.answerIconImage?.image = UIImage(systemName: "xmark")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
                }
            }
            
            if question.answer == Character(letterChoices[indexPath.row]) {
                cell?.answerIconImage?.image = UIImage(systemName: "checkmark")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
            }
        }
        
        return cell ?? UITableViewCell()
    }

}
