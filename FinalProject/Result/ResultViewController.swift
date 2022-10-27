//
//  ResultViewController.swift
//  FinalProject
//
//  Created by Ann Robles on 10/25/22.
//

import UIKit

class ResultViewController: ViewController {
    var score = 0
    var selectedOptions:[Int] = []
    
    @IBOutlet weak var retakeBtn: UIButton!
    @IBOutlet weak var scoreTextLabel: UILabel!
    @IBOutlet weak var resultTextLabel: UILabel!
    
    @IBOutlet weak var starStackView: UIStackView!
    @IBOutlet weak var sadImage: UIImageView!
    
    @IBOutlet weak var resultTableView: UITableView!
    
    @IBAction func retakeClicked(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let resultNib = UINib(nibName: "ResultTableViewCell", bundle: Bundle.main)
        resultTableView.register(resultNib, forCellReuseIdentifier: "ResultTableViewCell")
        
        
        navigationItem.hidesBackButton = true
        retakeBtn.isHidden = true
        
        // Do any additional setup after loading the view.
        print("in ResultViewController: \(score)")
        switch score {
            case 1:
                resultTextLabel?.text = "Good!"
            case 2:
                resultTextLabel?.text = "Very Good!"
            case 3:
                resultTextLabel?.text = "Excellent work!"
            default:
                resultTextLabel?.text = "Please try again!"
                retakeBtn.isHidden = false
        }
        
        scoreTextLabel?.text = "Your recycling score is \(score) out of 3."
        
        if score == 0 {
            starStackView.isHidden = true
            sadImage.isHidden = false
            resultTextLabel?.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        }
        else {
            sadImage.isHidden = true
            for subview in starStackView.subviews {
                if subview.tag <= score {
                    subview.tintColor = #colorLiteral(red: 0.8470588235, green: 0.7647058824, blue: 0.168627451, alpha: 1)
                }
            }
        }
    }

}

extension ResultViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell
        
        cell?.questionTextLabel?.text = "\(indexPath.row+1) - \(self.questions[self.qIndeces[indexPath.row]].questionText ?? "")"
        
        cell?.question = self.questions[self.qIndeces[indexPath.row]]
        
        if selectedOptions.count > 0 {
            cell?.selectedOption = selectedOptions[indexPath.row]
        }
        
        return cell ?? UITableViewCell()
    }

}
