//
//  Solver.swift
//  CheaterCheater
//
//  Created by Matt Ruston on 7/6/16.
//  Copyright © 2016 Jared Jones. All rights reserved.
//

import Foundation

class Solver {
    var scores = [Int: [String]]()      // dict of the scores and words in those scores
    var dictWordTree = WordTreeNode(value: "!")
    
    let letterScores = [Character: Int]() // dict of each characters score in the Scrabble rules
    
    // how to make globals and store data in cache
    
    init() {
        dictWordTree.createWordTree("Dictionary")
    }
    
    // find all of the words from the letters array
    func solve(word: String) -> [[Character]]{
        let letters = Array(word.characters)
        let allPerms = findAllPerms(letters)
        var wordsInTree = [[Character]]()
        for x in allPerms {
            if dictWordTree.findWord(x) {
                wordsInTree.append(x)
            }
        }
        return wordsInTree
    }
    
    func findAllPerms (letters: [Character]) -> [[Character]] {
        if letters.count <= 0 {
            return []
        } else if letters.count == 1 {
            return [letters]
        } else if letters.count == 2 {
            let a = letters.first!
            let b = letters.last!
            return [ [a], [b], [a,b], [b,a] ]
        }
        
        var permutations = [[Character]]()
        var usedLetters = [Character]()
        
        for x in 0..<letters.count {
            var rest = letters
            let currentLetter = rest.removeAtIndex(x)
            
            if usedLetters.contains(currentLetter) {
                continue
            } else {
                usedLetters.append(currentLetter)
            }
            
            let restPermutations = findAllPerms(rest)
            permutations = permutations + restPermutations + restPermutations.map { [currentLetter] + $0 }
        }
        
        return permutations
    }
    
    
    
    // find the score value of all the words in the global words array
    func findScores() {
        
    }
    
//    func checkDictionary(word: String) -> Bool{
////        letters = Array(word.characters)
////        return dictWordTree.findWord(letters)
//    }
//    
    

}
