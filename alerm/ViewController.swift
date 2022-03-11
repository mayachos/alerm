//
//  ViewController.swift
//  alerm
//
//  Created by maya on 2022/03/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myDPvar: UIDatePicker!
    @IBOutlet var setTimeLabel: UILabel!
    
    var tempTime: String = "00:00"
    var setTime: String = "00:00"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DatePickerのstyleをホイールにする
        myDPvar.preferredDatePickerStyle = .wheels
        // 起動した時点の時刻をmyLabelに反映
        myLabel.text = getNowTime()
        setTimeLabel.text = getNowTime()
        // 時間管理してくれる
        _ = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }

    @IBAction func myDPfunc() {
        // DPの値を成形
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        // 一時的にDPの値を保持
        tempTime = format.string(from: myDPvar.date)
    }
    
    @IBAction func myButtonfunc() {
        // アラームをセット
        setTime = tempTime
        // 表示
        setTimeLabel.text = "設定時刻: " + setTime
    }

    func getNowTime()-> String {
        // 現在時刻を取得
        let nowTime: NSDate = NSDate()
        // 成形する
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let nowTimeStr = format.string(from: nowTime as Date)
        // 成形した時刻を文字列として返す
        return nowTimeStr
    }
    
    @objc func update() {
        // 現在時刻を取得
        let str = getNowTime()
        // myLabelに反映
        myLabel.text = str
        // アラーム鳴らすか判断
        myAlarm(str: str)
    }
    
    func myAlarm(str: String) {
        // 現在時刻が設定時刻と一緒なら
        if str == setTime{
            alert()
        }
    }
    
    // アラートの表示
    func alert() {
        let myAlert = UIAlertController(title: "alert", message: "ring ding", preferredStyle: .alert)
        let myAction = UIAlertAction(title: "dong", style: .default) {
            action in print("foo!!")
        }
        myAlert.addAction(myAction)
        present(myAlert, animated: true, completion: nil)
    }
}

