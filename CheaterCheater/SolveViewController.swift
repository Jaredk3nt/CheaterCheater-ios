//
//  SolveViewController.swift
//  CheaterCheater
//
//  Created by Matt Ruston on 7/5/16.
//  Copyright © 2016 Jared Jones. All rights reserved.
//

import Foundation
import UIKit

protocol SolveViewControllerDelegate: class {
    
    func didTapSolveHand(letters: String)
    
}

class SolveViewController: UIViewController {
    
    @IBOutlet weak var handTextField: UITextField!
    @IBOutlet weak var extraTextField: UITextField!
    
    weak var delegate: SolveViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func didTapSolveHand(sender: AnyObject) {
        guard let letters = handTextField.text else {
            // TODO: tell user to input something
            assertionFailure("textField was nil")
            return
        }
        // TODO: make this a helper method
        let trimmedLetters = letters.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        if trimmedLetters.characters.count > 0 {
            for c in trimmedLetters.unicodeScalars {
                if !NSCharacterSet.letterCharacterSet().longCharacterIsMember(c.value) {
                    //TODO: tell user that they are typing mad shit yo
                    return
                }
            }
        }
        
        delegate?.didTapSolveHand(trimmedLetters)
    }
}