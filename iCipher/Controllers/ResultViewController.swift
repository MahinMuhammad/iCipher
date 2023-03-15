//
//  ResultViewController.swift
//  iCipher
//
//  Created by Md. Mahinur Rahman on 3/15/23.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultTextField: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var resultText:String?
    var numberOfShifts:Int?
    var side:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultTextField.text = resultText
        settingsLabel.text = "The text is shifted \(side ?? "Right") side by \(numberOfShifts ?? 1) places"
    }
    
    @IBAction func runAgainPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
