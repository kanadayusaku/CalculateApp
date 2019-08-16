//
//  ViewController.swift
//  calculateApp
//
//  Created by 金田祐作 on 2019/08/13.
//  Copyright © 2019 金田祐作. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //整数、小数どちらが入力されてもいいように準備
    var numberX: Float = 0
    var numberY: Float = 0
    var numberString: String = ""
    var operation: Int = 0
    
    //計算結果表示
    @IBOutlet weak var resultLabel: UILabel!

    //ボタン押下で数字を入力
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
    //加算の処理
    @IBAction func addition(_ sender: UIButton) {
        operatorSelected()
        resultLabel.text = sender.currentTitle
        operation = 1
    }
    //引き算の処理
    @IBAction func subtraction(_ sender: UIButton) {
        operatorSelected()
        resultLabel.text = sender.currentTitle
        operation = 2
    }
    //掛け算の処理
    @IBAction func multiplication(_ sender: UIButton) {
        operatorSelected()
        resultLabel.text = sender.currentTitle
        operation = 3
    }
    //割り算の処理
    @IBAction func division(_ sender: UIButton) {
        operatorSelected()
        resultLabel.text = sender.currentTitle
        operation = 4
    }

    // 「=」ボタン押下時の処理
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

    //「C」ボタンを押下した時の処理
    @IBAction func cButton(_ sender: UIButton) {
        numberX = 0
        numberY = 0
        numberString = ""
        operation = 0
        showNumber()
    }

    //結果を表示
    func showNumber() {
        resultLabel.text = numberString
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

