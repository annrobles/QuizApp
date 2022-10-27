//
//  Utils.swift
//  FinalProject
//
//  Created by Ann Robles on 10/27/22.
//

import UIKit

extension  UIViewController {

    func showAlert(withTitle title: String, withMessage message:String, handler: @escaping () -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            handler()
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
          // nothing happens
        }))
        
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}

