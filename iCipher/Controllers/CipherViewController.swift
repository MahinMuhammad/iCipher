//
//  ViewController.swift
//  iCipher
//
//  Created by Md. Mahinur Rahman on 1/5/23.
//

import UIKit

class CipherViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var shiftNumberLabel: UILabel!
    
    var cipherBrain:CipherBrain?
    
    var side:String?
    
    @IBAction func sideChanged(_ sender: UIButton) {
        leftButton.isSelected = false
        rightButton.isSelected = false
        
        switch(sender.currentTitle!){
        case"Left":
            leftButton.isSelected = true
            side = sender.currentTitle!
            break
        case"Right":
            rightButton.isSelected = true
            side = sender.currentTitle!
            break
        default:
            print("Side found nil")
            break
        }
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        shiftNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func runCipherPressed(_ sender: UIButton) {
        cipherBrain = CipherBrain(side: side, numberOfShifts: Int(shiftNumberLabel.text ?? "1"), inputText: inputTextField.text)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.resultText = cipherBrain?.runningCipher()
        resultViewController.side = cipherBrain?.side ?? "Right"
        resultViewController.numberOfShifts = cipherBrain?.numberOfShifts ?? 1
    }
}

