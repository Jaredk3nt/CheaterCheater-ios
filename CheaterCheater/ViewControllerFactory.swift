//
//  ViewControllerFactory.swift
//  CheaterCheater
//
//  Created by Matt Ruston on 7/5/16.
//  Copyright © 2016 Jared Jones. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerFactory: NSObject {
    
    class func createSolveViewController() -> SolveViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SolveViewController") as! SolveViewController
    }
    
    class func createSearchViewController() -> SearchViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SearchViewController") as! SearchViewController
    }
    
    class func createSolutionsViewController() -> SolutionsViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SolutionsViewController") as! SolutionsViewController
    }
}