//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 豊岡正紘 on 2019/08/12.
//  Copyright © 2019 Masahiro Toyooka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 計算結果を表示するラベル
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
    
    // 数字ボタンを押した時のアクション
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
        
        // ラベルを書き換える
        editLabel = true
        if sender.tag == 10 { // Cが押されたとき
            // クリアする
            allClear()
        } else if inValue && sender.tag == 15  {
            // = が押された時
            // 演算子を判定して、演算を実行
            switch operation {
            case 11:
                if numberOnScreen != 0 {
                    result = previousNumber / numberOnScreen
                } else {
                    result = Double.infinity
                }
            case 12:
                result = previousNumber * numberOnScreen
            case 13:
                result = previousNumber + numberOnScreen
            case 14:
                result = previousNumber - numberOnScreen
            default:
                break
            }
            // 少数点で値を分離
            let shosu: [String] = String(result).components(separatedBy: ".")
            
            if result.isInfinite {
                resultLabel.text = "エラー"
                allClear()
            } else if shosu.last == "0" {
                // 小数点以下が0であるなら
                resultLabel.text = String(Int(result))
                inValue = true
            }else { // 小数点以下が0でない
                resultLabel.text = String(result)
                inValue = true
            }
            
            // 数値を足せないようにする
            editLabel = false
        } else { // +,-,×,÷のいずれかが押されたとき
            // 画面に表示されている数字を変数に代入
            if inValue {
                previousNumber = Double(resultLabel.text!)!
                print(previousNumber)
            }
            switch sender.tag {
            case 11:
                resultLabel.text = "÷"
            case 12:
                resultLabel.text = "×"
            case 13:
                resultLabel.text = "+"
            case 14:
                resultLabel.text = "-"
            default:
                break
            }
            inValue = false
            // 演算子を記憶
            operation = sender.tag
            // 計算していい
            performingMath = true
        }
    }
}


