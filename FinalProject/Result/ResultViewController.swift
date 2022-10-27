//
//  ResultViewController.swift
//  FinalProject
//
//  Created by Ann Robles on 10/25/22.
//

import UIKit

class ResultViewController: ViewController {

    @IBAction func retakeClicked(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
