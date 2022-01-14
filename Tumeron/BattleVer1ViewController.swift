//
//  BattleVer1ViewController.swift
//  Tumeron
//
//  Created by 須藤　裕功 on 2021/04/29.
//

import UIKit
import AVFoundation

class BattleVer1ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var resetView: UIView!
    @IBOutlet var backToMenuView: UIView!
    
    @IBOutlet weak var tableView1P: UITableView!
    var input1PNumStringArray: [String] = []  //tableview表示用
    @IBOutlet weak var tableView2P: UITableView!
    var input2PNumStringArray: [String] = []
    
    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var label1P: UILabel!
    @IBOutlet weak var label2P: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var inputButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var backToMenuButton: UIButton!
    
    
    var input1pNumArray: [Int] = [] //1pの入力した数字が格納
    var input2pNumArray: [Int] = []
    
    var judgementOfwinner = 0
    
    var trueNumbersArray: [Int] = [] //答えの数字が格納される
    
    var sum: Int = 0 //counterの合計を代入
    
    var counter1 = 1
    var counter2 = 1
    var counter3 = 1
    var counter4 = 1
    var counter5 = 1
    var counter6 = 1
    var counter7 = 1
    var counter8 = 1
    var counter9 = 1
    var counter0 = 1
    var inputCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.audioPlayerOfGame.play()
        
        view.addSubview(resetView)
        resetView.center = view.center
        resetView.isHidden = true
        resetView.backgroundColor = UIColor(red: 247/255, green: 255/255, blue: 239/255, alpha: 1.0)
        resetView.layer.borderWidth = 3.5
        resetView.layer.borderColor = UIColor.orange.cgColor
        resetView.layer.cornerRadius = 20
        
        view.addSubview(backToMenuView)
        backToMenuView.center = view.center
        backToMenuView.isHidden = true
        backToMenuView.backgroundColor = UIColor(red: 247/255, green: 255/255, blue: 239/255, alpha: 1.0)
        backToMenuView.layer.borderWidth = 3.5
        backToMenuView.layer.borderColor = UIColor.orange.cgColor
        backToMenuView.layer.cornerRadius = 20
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToResultOfBattleVer1"{
            let BattleVer1ResultViewController = segue.destination as! BattleVer1ResultViewController
            BattleVer1ResultViewController.judgeImage = judgementOfwinner
            BattleVer1ResultViewController.trueNum = trueNumbersArray
        }
    }
    
    @IBAction func startButton(_ sender: Any){
        if trueNumbersArray.count == 0{
            inputCounter = 1
            counterEnabled()
            inputNumberLabel.text = "1Pのターン"
            label2P.text = " "
            let numbers = [1,2,3,4,5,6,7,8,9,0] //答えの数を作る
            let shuffledNum = numbers.shuffled()
            for i in 0..<4{
                trueNumbersArray.append(shuffledNum[i])
            }
            print(trueNumbersArray)
        }
    }
    
    @IBAction func button1(_ sender: Any) {
        if counter1 == 0 && trueNumbersArray.count > 3{
            judgeNumber(num: 1)
            counter1 += 1
            addButtonCounter()
            if sum <= 4{
                button1.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button2(_ sender: Any) {
        if counter2 == 0 && trueNumbersArray.count > 3{
            judgeNumber(num: 2)
            counter2 += 1
            addButtonCounter()
            if sum <= 4{
                button2.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button3(_ sender: Any) {
        if counter3 == 0 && trueNumbersArray.count > 3{
            judgeNumber(num: 3)
            counter3 += 1
            addButtonCounter()
            if sum <= 4{
                button3.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button4(_ sender: Any) {
        if counter4 == 0 && trueNumbersArray.count > 3{
            judgeNumber(num: 4)
            counter4 += 1
            addButtonCounter()
            if sum <= 4{
                button4.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button5(_ sender: Any) {
        if counter5 == 0 && trueNumbersArray.count > 3{
            judgeNumber(num: 5)
            counter5 += 1
            addButtonCounter()
            if sum <= 4{
                button5.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button6(_ sender: Any) {
        if counter6 == 0 && trueNumbersArray.count > 3{
            judgeNumber(num: 6)
            counter6 += 1
            addButtonCounter()
            if sum <= 4{
                button6.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button7(_ sender: Any) {
        if counter7 == 0 && trueNumbersArray.count > 3{
            judgeNumber(num: 7)
            counter7 += 1
            addButtonCounter()
            if sum <= 4{
                button7.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button8(_ sender: Any) {
        if counter8 == 0 && trueNumbersArray.count > 3{
            judgeNumber(num: 8)
            counter8 += 1
            addButtonCounter()
            if sum <= 4{
                button8.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button9(_ sender: Any) {
        if counter9 == 0 && trueNumbersArray.count > 3{
            judgeNumber(num: 9)
            counter9 += 1
            addButtonCounter()
            if sum <= 4{
                button9.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button0(_ sender: Any) {
        if counter0 == 0 && trueNumbersArray.count > 3{
            judgeNumber(num: 0)
            counter0 += 1
            addButtonCounter()
            if sum <= 4{
                button0.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    func judgeNumber(num: Int){
        if inputCounter % 2 == 1{
            if input1pNumArray.count <= 3{
                input1pNumArray.append(num)
            }
        }else{
            if input2pNumArray.count <= 3{
                input2pNumArray.append(num)
            }
        }
        inputNumLabel()
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        if input1pNumArray.count > 0 || input2pNumArray.count > 0{
            if inputCounter % 2 == 1{
                input1pNumArray.removeAll()
                inputNumberLabel.text = "1Pのターン"
            }else{
                input2pNumArray.removeAll()
                inputNumberLabel.text = "2Pのターン"
            }
            counterEnabled()
            buttonTitleColor()
            sum = 0
        }
    }
    
    @IBAction func inputButton(_ sender: Any) {
        if input1pNumArray.count == 4 || input2pNumArray.count == 4{
            if inputCounter % 2 == 1{
                checkNumbers(inputNum: self.input1pNumArray, trueNum: self.trueNumbersArray)
            }else{
                checkNumbers(inputNum: self.input2pNumArray, trueNum: self.trueNumbersArray)
            }
            counterEnabled()
            buttonTitleColor()
            sum = 0
            self.inputCounter += 1
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        if trueNumbersArray.count > 0{
            resetView.isHidden = false
            buttonIsNotEnabled()
        }
    }
    
    @IBAction func doResetButton(_ sender: UIButton) {
        resetView.isHidden = true
        reset()
        buttonIsEnabled()
    }
    
    @IBAction func doNotResetButton(_ sender: UIButton) {
        resetView.isHidden = true
        buttonIsEnabled()
    }
    
    @IBAction func backToMenuButton(_ sender: Any) {
        backToMenuView.isHidden = false
        buttonIsNotEnabled()
    }
    
    @IBAction func doBackToMenuButton(_ sender: UIButton) {
        appDelegate.audioPlayerOfGame.stop()
        appDelegate.audioPlayerOfGame.currentTime = 0
        dismiss(animated: true, completion: nil)
        appDelegate.audioPlayer.play()
    }
    
    @IBAction func doNotBackToMenuButton(_ sender: UIButton) {
        backToMenuView.isHidden = true
        buttonIsEnabled()
    }
    
    func buttonIsEnabled(){
        button1.isEnabled = true
        button2.isEnabled = true
        button3.isEnabled = true
        button4.isEnabled = true
        button5.isEnabled = true
        button6.isEnabled = true
        button7.isEnabled = true
        button8.isEnabled = true
        button9.isEnabled = true
        button0.isEnabled = true
        deleteButton.isEnabled = true
        inputButton.isEnabled = true
        startButton.isEnabled = true
        resetButton.isEnabled = true
        backToMenuButton.isEnabled = true
    }
    
    func buttonIsNotEnabled(){
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
        button5.isEnabled = false
        button6.isEnabled = false
        button7.isEnabled = false
        button8.isEnabled = false
        button9.isEnabled = false
        button0.isEnabled = false
        deleteButton.isEnabled = false
        inputButton.isEnabled = false
        startButton.isEnabled = false
        resetButton.isEnabled = false
        backToMenuButton.isEnabled = false
    }
    
    func inputNumLabel(){
        if inputCounter % 2 == 1{
            let inputNumStr = input1pNumArray.map{ String($0) } //文字の配列に変換
            inputNumberLabel.text = inputNumStr.joined(separator: " ") //文字列に変換
        }else{
            let inputNumStr = input2pNumArray.map{ String($0) } //文字の配列に変換
            inputNumberLabel.text = inputNumStr.joined(separator: " ") //文字列に変換
        }
    }
    
    func checkNumbers(inputNum: [Int], trueNum: [Int]){
        var h = 0
        var b = 0
        for i in 0..<4{
            for j in 0..<4{
                if trueNum[i] == inputNum[j]{
                    if j==i{
                        h += 1
                    }else{
                        b += 1
                    }
                }
            }
        }
        if h == 4{ //全部答えと一緒だったときの処理
            showResult(inputNumber: inputNum, checkH: h, checkB: b)
            if inputCounter % 2 == 1{
                judgementOfwinner = 1
                let tableView = self.view.viewWithTag(1) as! UITableView
                tableView.reloadData()
            }else{
                judgementOfwinner = 2
                let tableView = self.view.viewWithTag(2) as! UITableView
                tableView.reloadData()
            }
            showPopup()
            reset()
        }else { //答えと一致しない時
            showResult(inputNumber: inputNum, checkH: h, checkB: b)
            if inputCounter % 2 == 1{
                let tableView = self.view.viewWithTag(1) as! UITableView
                tableView.reloadData()
                inputNumberLabel.text = "2Pのターン"
                label1P.text = " "
                label2P.text = "2P"
            }else{
                let tableView = self.view.viewWithTag(2) as! UITableView
                tableView.reloadData()
                inputNumberLabel.text = "1Pのターン"
                label1P.text = "1P"
                label2P.text = " "
            }
            input1pNumArray.removeAll()
            input2pNumArray.removeAll()
        }
    }
    
    func showResult(inputNumber: [Int], checkH: Int, checkB: Int){
        let result1 = inputNumber.map(String.init) //整数の配列を文字の配列に変換
        let result2 = result1.joined(separator: "") //配列を結合
        let result3 = "= " + String(checkH) + "H" + String(checkB) + "B"
        let result = result2 + " " + result3
        if self.inputCounter % 2 == 1{
            input1PNumStringArray.insert(result, at: 0)
        }else{
            input2PNumStringArray.insert(result, at: 0)
        }
    }
    
    func showPopup(){
        performSegue(withIdentifier: "SegueToResultOfBattleVer1", sender: nil)
        appDelegate.audioPlayerOfGame.stop()
        appDelegate.audioPlayerOfGame.currentTime = 0
    }
    
    func reset(){
        input1pNumArray.removeAll()
        input2pNumArray.removeAll()
        trueNumbersArray.removeAll()
        input1PNumStringArray.removeAll()
        input2PNumStringArray.removeAll()
        for i in 1...2{
            let tableView = self.view.viewWithTag(i) as! UITableView
            tableView.reloadData()
        }
        inputNumberLabel.text = "スタートを押して下さい"
        label1P.text = "１P"
        label2P.text = "２P"
        counterUnEnabled()
        buttonTitleColor()
        sum = 0
    }
    
    func counterEnabled(){
        counter1 = 0
        counter2 = 0
        counter3 = 0
        counter4 = 0
        counter5 = 0
        counter6 = 0
        counter7 = 0
        counter8 = 0
        counter9 = 0
        counter0 = 0
    }
    
    func counterUnEnabled(){
        counter1 = 1
        counter2 = 1
        counter3 = 1
        counter4 = 1
        counter5 = 1
        counter6 = 1
        counter7 = 1
        counter8 = 1
        counter9 = 1
        counter0 = 1
    }
    
    func buttonTitleColor(){
        let originalColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
        button1.setTitleColor(originalColor, for: .normal)
        button2.setTitleColor(originalColor, for: .normal)
        button3.setTitleColor(originalColor, for: .normal)
        button4.setTitleColor(originalColor, for: .normal)
        button5.setTitleColor(originalColor, for: .normal)
        button6.setTitleColor(originalColor, for: .normal)
        button7.setTitleColor(originalColor, for: .normal)
        button8.setTitleColor(originalColor, for: .normal)
        button9.setTitleColor(originalColor, for: .normal)
        button0.setTitleColor(originalColor, for: .normal)
    }
    
    func addButtonCounter(){
        sum = counter1 + counter2 + counter3 + counter4 + counter5 + counter6 + counter7 + counter8 + counter9 + counter0
    }
    
}

extension BattleVer1ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView.tag == 1){
            return input1PNumStringArray.count
        }else {
            return input2PNumStringArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(tableView.tag == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1P", for: indexPath)
            cell.textLabel?.adjustsFontSizeToFitWidth = true
            cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
            cell.textLabel!.text = input1PNumStringArray[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2P", for: indexPath)
            cell.textLabel?.adjustsFontSizeToFitWidth = true
            cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
            cell.textLabel!.text = input2PNumStringArray[indexPath.row]
            return cell
        }
    }
}

