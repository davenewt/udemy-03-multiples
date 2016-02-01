//
//  ViewController.swift
//  udemy-03-multiples
//
//  Created by David Stroud on 01/02/2016.
//  Copyright © 2016 David Stroud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var multiplyBy = 0
    var currentTotal = 0
    var previousTotal = 0
    var maxTotal = 100
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var multiplyingTextLabel: UILabel!
    @IBOutlet weak var multiplyByInputField: UITextField!
    
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        
        // make sure something has been entered in the 'multiply by' text field
        if multiplyByInputField.text != nil && multiplyByInputField.text != "" {
            
            // hide front screen elements and show game screen elements
            showGameScreen()
            
            // set initial variables for game
            multiplyBy = Int(multiplyByInputField.text!)!
            previousTotal = 0
            increaseCurrentTotal()
            
            // set initial text display
            setMultiplyingTextLabel()

        }
        
    }
    
    @IBAction func onAddBtnPressed(sender: UIButton!) {
        
        // see if we've reached our max value, if so, reset
        if ((currentTotal + multiplyBy) > maxTotal) {
            resetGame()
        } else {
            // set 'previousTotal', add the multiple to 'currentTotal' and set the label to display the result
            previousTotal = currentTotal
            increaseCurrentTotal()
            setMultiplyingTextLabel()
        }
        
    }
    
    func setMultiplyingTextLabel() {
        multiplyingTextLabel.text = "\(previousTotal) + \(multiplyBy) = \(currentTotal)"

    }
    
    func resetGame() {
        
        logoImg.hidden = false
        playBtn.hidden = false
        multiplyByInputField.hidden = false
        addBtn.hidden = true
        multiplyingTextLabel.hidden = true
        
        currentTotal = 0
        previousTotal = 0
        multiplyBy = 0
    
    }
    
    func showGameScreen() {
        
        logoImg.hidden = true
        playBtn.hidden = true
        multiplyByInputField.hidden = true
        addBtn.hidden = false
        multiplyingTextLabel.hidden = false
        
    }
    
    func increaseCurrentTotal() {
        currentTotal = currentTotal + multiplyBy
    }

    
}

