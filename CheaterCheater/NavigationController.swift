//
//  NavigationController.swift
//  CheaterCheater
//
//  Created by Matt Ruston on 7/5/16.
//  Copyright © 2016 Jared Jones. All rights reserved.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewController = self.viewControllers.first as? ViewController {
            viewController.delegate = self
        }
        
        
    }
}


//MARK: - View Controller Delegate Methods
extension NavigationController: ViewControllerDelegate {
    
    func didTapSolve() {
        let solveViewController = ViewControllerFactory.createSolveViewController()
        solveViewController.delegate = self
        pushViewController(solveViewController, animated: true)
    }
    
    func didTapSearch() {
        let searchViewController = ViewControllerFactory.createSearchViewController()
        pushViewController(searchViewController, animated: true)
    }

}

//MARK: - Solve View Controller Delegate Methods
extension NavigationController: SolveViewControllerDelegate {
    
    func didTapSolveHand(letters: String) {
        let solutionsViewController = ViewControllerFactory.createSolutionsViewController()
        solutionsViewController.letters = letters
        pushViewController(solutionsViewController, animated: true)
        
    }
    
}