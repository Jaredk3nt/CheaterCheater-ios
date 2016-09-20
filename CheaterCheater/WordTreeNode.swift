//
//  WordTreeNode.swift
//  CheaterCheater
//
//  Created by Matt Ruston on 7/6/16.
//  Copyright © 2016 Jared Jones. All rights reserved.
//
//  *When creating the head node of the WordTree use ! as the value Character*
//

import Foundation

class WordTreeNode: NSObject {
    var value: Character
    var nextLevel = [WordTreeNode]()
    var endPoint: Bool = false
    
    init(value: Character) {
        self.value = value
        super.init()
    }
    
    /* function to add a word to the tree,
    should only be used on head node */
    func addWord(word: Array<Character>) {
        var letters = word
        if letters.count == 0 {
            endPoint = true
            return
        }else {
            let nextNode = WordTreeNode(value: letters.removeFirst())
            /* add letter node to the nextLevel then continue to add word from the next node down,
            add child returns either the node added or the node that already exists with the intended letter
            so we add the word to the returned to make sure we stay on the tree */
            addChild(nextNode).addWord(letters)
        }
    }
    
    // add a node to the current nodes next level
    func addChild(child: WordTreeNode) -> WordTreeNode{
        let val = child.value
        var found = false
        // see if value already exists in nodes next level
        for node in nextLevel{
            if node.value == val {
                found = true
                return node
            }
        }
        // if not add to next level
        if found == false {
            nextLevel.append(child)
        }
        return child
    }
    
    func findNode(letter: Character) -> WordTreeNode? {
        if nextLevel.count == 0 {
            return nil
        }
        
        for node in nextLevel {
            if node.value == letter {
                return node
            }
        }
        
        return nil
    }
    
    // search for word in the WordTree
    // Call only on headnode for best results
    func findWord(word: Array<Character>) -> Bool {
        var letters = word
        if word.count == 0 {
            if endPoint == true {
                return true
            }
            return false
        } else {
            if let nextChild = findNode(letters.removeFirst()) {
                return nextChild.findWord(letters)
            } else {
                return false
            }
            
        }
    }
    
    // will return the head node of a complete word tree of given dictionary file
    func createWordTree(fileName: String){
        guard let words = parseFileToArray(fileName) else {
            print("break on parse")
            return
        }
        
        for word in words {
            addWord(Array(word.characters))
        }
    }
    
    // parse a given .txt file into an array of strings
    func parseFileToArray(fileName: String) -> [String]? {
        guard let path = NSBundle.mainBundle().pathForResource("Dictionary", ofType: "txt") else {
            return nil
        }
        
        do {
            let content = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            return content.componentsSeparatedByString("\n")
        } catch _ as NSError {
            return nil
        }
    }
    
    // test if node is the head node of the WordTree
    func isHead() -> Bool {
        if value == "!" {
            return true
        } else {
            return false
        }
    }
}








