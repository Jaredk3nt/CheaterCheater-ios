//
//  ViewController.swift
//  CheaterCheater
//
//  Created by Matt Ruston on 7/5/16.
//  Copyright © 2016 Jared Jones. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: class {
    func didTapSolve()
    func didTapSearch()
}

class ViewController: UIViewController {
    @IBOutlet weak var titleLable: UILabel!
    var myView: UIView? {
        didSet {
            if let newView = myView where myView?.superview == nil {
                view.addSubview(newView)
            }
        }
    }
    weak var delegate: ViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    @IBAction func didTapSolve(sender: UIButton) {
//        let S = Solver()
//        let allWords = S.solve("matt")
//        print(allWords)
        delegate?.didTapSolve()
    }
    
    @IBAction func didTapSearch(sender: UIButton) {
        myView = UIView()
        myView?.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        myView?.backgroundColor = UIColor.orangeColor()
    }

}

