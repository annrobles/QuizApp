//
//  QuestionTableViewCell.swift
//  FinalProject
//
//  Created by Ann Robles on 10/26/22.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var optionImage: UIImageView!
    @IBOutlet weak var answerIconImage: UIImageView!
    @IBOutlet weak var optionLetterLabel: UILabel!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var optionImageHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        optionLetterLabel.superview?.layer.borderWidth = 1
        optionLetterLabel.superview?.layer.borderColor = UIColor.darkGray.cgColor
        optionLetterLabel.superview?.layer.cornerRadius = 2
        
        self.contentView.layer.cornerRadius = 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        if selected {
            self.contentView.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.968627451, blue: 0.9607843137, alpha: 1)
            optionLetterLabel.superview?.layer.backgroundColor = #colorLiteral(red: 0.4431372549, green: 0.6784313725, blue: 0.6392156863, alpha: 1)
            optionLetterLabel.superview?.layer.borderColor = #colorLiteral(red: 0.367827177, green: 0.7387055755, blue: 0.7374933958, alpha: 1)
        }
        else {
            self.contentView.backgroundColor = .white
            self.contentView.tintColor = .white
            optionLetterLabel.superview?.layer.borderColor = UIColor.darkGray.cgColor
            optionLetterLabel.superview?.layer.backgroundColor = .none
        }
    }
    
}

