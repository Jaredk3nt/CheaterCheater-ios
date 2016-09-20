//
//  SolutionsViewController.swift
//  CheaterCheater
//
//  Created by Matt Ruston on 7/19/16.
//  Copyright © 2016 Jared Jones. All rights reserved.
//

import Foundation
import UIKit

class SolutionsViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lettersLabel: UILabel!
    @IBOutlet weak var bestWordLabel: UILabel!
    @IBOutlet weak var bestWordScoreLabel: UILabel!
    @IBOutlet weak var yellowLineView: UIView!
    @IBOutlet weak var solutionTableView: UITableView!
    @IBOutlet weak var loadingView: UIVisualEffectView!
    
    var letters = "" {
        didSet {
            if solutionTableView != nil {
                loadSolutions()
            }
        }
    }
    
    private var solutions: [[Character]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yellowLineView.layer.cornerRadius = 1.5
        containerView.layer.cornerRadius = 5
        
        solutionTableView.delegate = self
        solutionTableView.dataSource = self
        
        if letters != "" {
            loadSolutions()
        }
    }
    
    private func loadSolutions() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { [weak self] in
            guard let weakSelf = self else {
                return
            }
            
            let solver = Solver()
            weakSelf.solutions = solver.solve(weakSelf.letters)
            
            dispatch_async(dispatch_get_main_queue()) {
                UIView.animateWithDuration(0.5, animations: { 
                    weakSelf.solutionTableView.reloadData()
                    weakSelf.loadingView.alpha = 0
                })
            }
        }
    }
}


extension SolutionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("solutionCell", forIndexPath: indexPath)
        
        if let cell = cell as? SolutionTableViewCell {
            cell.wordLabel.text = String(solutions[indexPath.row])
            cell.scoreLabel.text = "\(random())"
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return solutions.count
    }
}