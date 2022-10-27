//
//  ResultViewController.swift
//  FinalProject
//
//  Created by Ann Robles on 10/25/22.
//

import UIKit

class ResultViewController: ViewController {
    var score = 0
    
    @IBOutlet weak var retakeBtn: UIButton!
    
    @IBAction func retakeClicked(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        retakeBtn.isHidden = true
        
        // Do any additional setup after loading the view.
        if score == 0 {
            retakeBtn.isHidden = false
        }
    }

}
