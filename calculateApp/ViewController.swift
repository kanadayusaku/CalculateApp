//
//  ViewController.swift
//  calculateApp
//
//  Created by 金田祐作 on 2019/08/13.
//  Copyright © 2019 金田祐作. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberX: Float = 0
    var numberY: Float = 0
    var numberString: String = ""
    var operation: Int = 0
    
    //結果表示
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func numbers(_ sender: UIButton) {
        if (sender.currentTitle != nil) {
            numberString += sender.currentTitle!
        } else {
            numberString += "0"
        }
        showNumber()
    }
    
    func operatorSelected() {
        if (numberString == "") {
            return
        }
        numberX = Float(numberString)!
        numberString = ""
    }
    
    @IBAction func addition(_ sender: UIButton) {
        operatorSelected()
        resultLabel.text = sender.currentTitle
        operation = 1
    }
    @IBAction func subtraction(_ sender: UIButton) {
        operatorSelected()
        resultLabel.text = sender.currentTitle
        operation = 2
    }
    @IBAction func multiplication(_ sender: UIButton) {
        operatorSelected()
        resultLabel.text = sender.currentTitle
        operation = 3
    }
    @IBAction func division(_ sender: UIButton) {
        operatorSelected()
        resultLabel.text = sender.currentTitle
        operation = 4
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        if (Int(numberString) == nil) {
            return
        }
        numberY = Float(numberString)!
        switch (operation) {
        case 0:
            resultLabel.text = "\(numberX)"
        case 1:
            numberX = numberX + numberY
        case 2:
            numberX = numberX - numberY
        case 3:
            numberX = numberX * numberY
        case 4:
            numberX = numberX / numberY
        default:
            resultLabel.text = "Something went wrong..."
            return
        }
        if let resultNumber = Int(exactly: numberX) {
            resultLabel.text = "\(resultNumber)"
            numberString = "\(resultNumber)"
        } else {
            resultLabel.text = "\(numberX)"
        }
        operation = 0
    }
    
    @IBAction func cButton(_ sender: UIButton) {
        numberX = 0
        numberY = 0
        numberString = ""
        operation = 0
        showNumber()
    }
    
    
    
    func showNumber() {
        resultLabel.text = numberString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

