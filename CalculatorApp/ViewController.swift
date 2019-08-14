//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 豊岡正紘 on 2019/08/12.
//  Copyright © 2019 Masahiro Toyooka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    /// 画面上の数字
    var numberOnScreen: Double = 0
    /// 前回表示されていた数字
    var previousNumber: Double = 0
    /// 四則演算の演算子
    var operation: Int = 0
    /// 計算結果を入れる
    var result: Double = 0
    /// 数値が入力されたかどうかの判断
    var inValue: Bool = false
    /// 計算してもいいかどうかの判断
    var performingMath: Bool = false
    /// ラベルを編集できるかどうか
    var editLabel: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // クリアする関数
    func allClear() {
        // クリアする
        resultLabel.text = ""
        result = 0
        previousNumber = 0
        numberOnScreen = 0
        operation = 0
        inValue = false
        editLabel = true
        performingMath = false
    }
    
    @IBAction func numberButtons(_ sender: UIButton) {
        
        if editLabel {
            if performingMath {
                resultLabel.text = String(sender.tag)
                numberOnScreen = Double(resultLabel.text!)!
                performingMath = false
            } else {
                resultLabel.text = resultLabel.text! + String(sender.tag)
                numberOnScreen = Double(resultLabel.text!)!
            }
        }
        inValue = true
    }
    
    @IBAction func actionsButton(_ sender: UIButton) {
        
        
        
        
    }
}

