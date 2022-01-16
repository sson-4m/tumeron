//
//  TimeAttackViewController.swift
//  Tumeron
//
//  Created by 須藤　裕功 on 2021/04/18.
//

import UIKit
import AVFoundation

class TimeAttackViewController: UIViewController{
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var showImageTA: UIImageView! //イラストの表示
    let image1 = UIImage(named:"hit1.jpg")!
    let image2 = UIImage(named:"hit2.jpg")!
    let image3 = UIImage(named:"hit3.jpg")!
    let image4 = UIImage(named:"hit4.jpg")!
    
    @IBOutlet weak var timerMinute: UILabel!
    @IBOutlet weak var timerSecond: UILabel!
    @IBOutlet weak var timerMSec: UILabel!
    
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
    
    
    var minute: Int = 0
    var second: Int = 0
    var msec: Int = 0
    
    weak var timer: Timer! //時間
    var startTime = Date()
    var sMinute: String = "" //時間が代入される変数の宣言
    var sSecond: String = ""
    var sMsec: String = ""
    var passedTime: String = ""
    
    @IBOutlet weak var inputNumberLabel: UILabel!
    var inputNumbersArray: [Int] = []  //入力した数字が格納される
    @IBOutlet weak var tableView: UITableView!
    var resultsUpdatedInTableView: [String] = [] //tableviewにのる結果
    var resultspassed: String = ""
    var resultspassedArray: [String] = []
    
    var trueNumbersArray: [Int] = [] //答えの数字が格納される
    
    var sum: Int = 0
    
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
    var rowCounter = 0
    
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.audioPlayerOfGame.play()
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultOfTimeAttack"{
            let TimeAttackPopOverViewController = segue.destination as! TimeAttackPopOverViewController
            TimeAttackPopOverViewController.text1 = passedTime
            TimeAttackPopOverViewController.text2 = String(rowCounter)
            TimeAttackPopOverViewController.resultArray = resultspassedArray
            var getScores: [String] = userDefaults.array(forKey: "score") as? [String] ?? []
            let savedInformation = "タイム: " + passedTime + "  試行回数:" + String(rowCounter) + "回"
            getScores.append(savedInformation)
            userDefaults.set(getScores, forKey: "score")
        }
    }
    
    @IBAction func startButton(_ sender: UIButton){
        if trueNumbersArray.count == 0{
            showImageTA.isHidden = false
            counterEnabled()
            rowCounter = 0
            inputNumberLabel.text = "数字をタップして入力"
            let numbers = [1,2,3,4,5,6,7,8,9,0]
            let shuffledNum = numbers.shuffled()
            for i in 0..<4{
                trueNumbersArray.append(shuffledNum[i])
            }
            timer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target: self,
                selector: #selector(self.timerCounter),
                userInfo: nil,
                repeats: true)
            startTime = Date()
            showImageTA.image = image1
            print(trueNumbersArray)
        }
    }
    
    @IBAction func button1(_ sender: UIButton) {
        if counter1 == 0{
            judgeNumber(num: 1)
            counter1 += 1
            addButtonCounter()
            if sum <= 4{
                button1.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button2(_ sender: UIButton) {
        if counter2 == 0{
            judgeNumber(num: 2)
            counter2 += 1
            addButtonCounter()
            if sum <= 4{
                button2.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button3(_ sender: UIButton) {
        if counter3 == 0{
            judgeNumber(num: 3)
            counter3 += 1
            addButtonCounter()
            if sum <= 4{
                button3.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button4(_ sender: UIButton) {
        if counter4 == 0{
            judgeNumber(num: 4)
            counter4 += 1
            addButtonCounter()
            if sum <= 4{
                button4.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button5(_ sender: UIButton) {
        if counter5 == 0{
            judgeNumber(num: 5)
            counter5 += 1
            addButtonCounter()
            if sum <= 4{
                button5.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button6(_ sender: UIButton) {
        if counter6 == 0{
            judgeNumber(num: 6)
            counter6 += 1
            addButtonCounter()
            if sum <= 4{
                button6.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button7(_ sender: UIButton) {
        if counter7 == 0{
            judgeNumber(num: 7)
            counter7 += 1
            addButtonCounter()
            if sum <= 4{
                button7.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button8(_ sender: UIButton) {
        if counter8 == 0{
            judgeNumber(num: 8)
            counter8 += 1
            addButtonCounter()
            if sum <= 4{
                button8.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button9(_ sender: UIButton) {
        if counter9 == 0{
            judgeNumber(num: 9)
            counter9 += 1
            addButtonCounter()
            if sum <= 4{
                button9.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button0(_ sender: UIButton) {
        if counter0 == 0{
            judgeNumber(num: 0)
            counter0 += 1
            addButtonCounter()
            if sum <= 4{
                button0.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    func judgeNumber(num: Int){
        if inputNumbersArray.count <= 3 && trueNumbersArray.count > 3{
            inputNumbersArray.append(num)
            inputNumLabel()
        }
    }
    
    func inputNumLabel(){
        let inputNumStr = inputNumbersArray.map{ String($0) } //文字の配列に変換
        inputNumberLabel.text = inputNumStr.joined(separator: " ") //文字列に変換
    }
    
    
    @IBAction func deleteButton(_ sender: UIButton) {
        if inputNumbersArray.count > 0 && rowCounter != -1{
            inputNumbersArray.removeAll()
            counterEnabled()
            inputNumberLabel.text = "数字をタップして入力"
            counterEnabled()
            buttonTitleColor()
        }
    }
    
    @IBAction func inputButton(_ sender: UIButton) {
        if inputNumbersArray.count == 4 && rowCounter != -1{
            checkNumbers(inputNum: self.inputNumbersArray, trueNum: self.trueNumbersArray)
            
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        reset()
    }
    
    @IBAction func backToMenuButton(_ sender: UIButton) {
        if timer != nil{
            timer.invalidate()
        }
        appDelegate.audioPlayerOfGame.stop()
        appDelegate.audioPlayerOfGame.currentTime = 0
        dismiss(animated: true, completion: nil)
        appDelegate.audioPlayer.play()
    }
    
    @objc func timerCounter() {
        // タイマー開始からのインターバル時間
        let currentTime = Date().timeIntervalSince(startTime)
        // fmod() 余りを計算
        minute = (Int)(fmod((currentTime/60), 60))
        // currentTime/60 の余り
        second = (Int)(fmod(currentTime, 60))
        // floor 切り捨て、小数点以下を取り出して *100
        msec = (Int)((currentTime - floor(currentTime))*100)
        // %02d： ２桁表示、0で埋める
        sMinute = String(format:"%02d", minute)
        sSecond = String(format:"%02d", second)
        sMsec = String(format:"%02d", msec)
        
        timerMinute.text = sMinute + ":"
        timerSecond.text = sSecond
        timerMSec.text = "." + sMsec
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
            
            showPopup()
            reset()
        }else { //答えと一致しない時
            showResult(inputNumber: inputNum, checkH: h, checkB: b)
            imageJudge(countH: h, countB: b)
            inputNumbersArray.removeAll()
            inputNumberLabel.text = "数字をタップして入力"
            counterEnabled()
            buttonTitleColor()
        }
    }
    
    func showResult(inputNumber: [Int], checkH: Int, checkB: Int){
        rowCounter += 1
        let result1 = inputNumber.map(String.init) //整数の配列を文字の配列に変換
        let result2 = result1.joined(separator: "") //配列を結合
        let result3 = "= " + String(checkH) + "H" + String(checkB) + "B"
        let result = result2 + " " + result3
        resultspassed = String(rowCounter) + ": " + result
        resultsUpdatedInTableView.insert(result, at: 0)
        resultspassedArray.append(resultspassed)
        tableView.reloadData()
        calculateScore()
    }
    
    func calculateScore(){
         score = (minute * 60 + second + msec) * 100 * rowCounter
    }
    
    func showPopup(){
        passedTime = sMinute + "分" + sSecond + "秒" + sMsec
        timer.invalidate()
        performSegue(withIdentifier: "resultOfTimeAttack",sender: nil)
        appDelegate.audioPlayerOfGame.stop()
        appDelegate.audioPlayerOfGame.currentTime = 0
        rowCounter = -1
    }
    
    func imageJudge(countH: Int, countB: Int){ //イラストの出力
        if resultsUpdatedInTableView.count >= 5 && countH == 3{
            showImageTA.image = image4
        }else if (countH + countB >= 3 || countH == 2) && resultsUpdatedInTableView.count >= 3{
            showImageTA.image = image3
        }else if (countH == 1 || countH + countB >= 2) && resultsUpdatedInTableView.count >= 1{
            showImageTA.image = image2
        }else if countH + countB == 0{
            showImageTA.image = image1
        }
    }
    
    func reset(){
        showImageTA.isHidden = true
        if timer != nil{
            timer.invalidate()
        }
        timerMinute.text = "00:"
        timerSecond.text = "00"
        timerMSec.text = ".00"
        inputNumbersArray.removeAll()
        trueNumbersArray.removeAll()
        resultsUpdatedInTableView.removeAll()
        resultspassedArray.removeAll()
        tableView.reloadData()
        counterUnEnabled()
        buttonTitleColor()
        sum = 0
        inputNumberLabel.text = "スタートを押して下さい"
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

extension TimeAttackViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsUpdatedInTableView.count
    }    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
        cell.textLabel!.text = resultsUpdatedInTableView[indexPath.row]
        return cell
    }
}
