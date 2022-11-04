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
    
    var showImageTA: UIImageView = UIImageView()
    let image1 = UIImage(named:"hit1.jpg")!
    let image2 = UIImage(named:"hit2.jpg")!
    let image3 = UIImage(named:"hit3.jpg")!
    let image4 = UIImage(named:"hit4.jpg")!
    
    var designLabel: UILabel = UILabel()
    var timerLabel: UILabel = UILabel()
    var tableView: UITableView = UITableView()
    
    var backToMenuButton: UIButton = UIButton()
    var startButtom: UIButton = UIButton()
    var resetButton: UIButton = UIButton()
    var enterdInformationLabel: UILabel = UILabel()
    var okButton: UIButton = UIButton()
    var deleteButton: UIButton = UIButton()
    var button0: UIButton = UIButton()
    var button9: UIButton = UIButton()
    var button8: UIButton = UIButton()
    var button7: UIButton = UIButton()
    var button6: UIButton = UIButton()
    var button5: UIButton = UIButton()
    var button4: UIButton = UIButton()
    var button3: UIButton = UIButton()
    var button2: UIButton = UIButton()
    var button1: UIButton = UIButton()
    
    
    var minute: Int = 0
    var second: Int = 0
    var msec: Int = 0
    
    
    var currentTime = 0.0
    
    
    weak var timer: Timer! //時間
    var startTime = Date()
    var sMinute: String = "" //時間が代入される変数の宣言
    var sSecond: String = ""
    var sMsec: String = ""
    var passedTime: String = ""
    

    var inputNumbersArray: [Int] = []  //入力した数字が格納される
    var resultsUpdatedInTableView: [String] = []
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
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultOfTimeAttack"{
            let TimeAttackPopOverViewController = segue.destination as! TimeAttackPopOverViewController
            TimeAttackPopOverViewController.text1 = passedTime
            TimeAttackPopOverViewController.text2 = String(rowCounter)
            TimeAttackPopOverViewController.resultArray = resultspassedArray
            var getScores: [String] = UserDefaults.standard.stringArray(forKey: "score") ?? []
            let savedInformation = [String(sMinute) + "分" + String(sSecond) + "秒" + String(sMsec)]
            getScores.append(contentsOf: savedInformation)
            UserDefaults.standard.set(getScores, forKey: "score")
            
            
            DateFormatter().dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMd", options: 0, locale: Locale(identifier: "ja_JP"))
            print(DateFormatter().string(from: Date()))
            var getTime: [String] = UserDefaults.standard.stringArray(forKey: "time") ?? []
            let savedTime = [DateFormatter().string(from: Date())]
            print(savedTime)
            getTime.append(contentsOf: savedTime)
            UserDefaults.standard.set(getTime, forKey: "score")
             
        }
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        appDelegate.audioPlayerOfGame.play()
        
        
        let halfOfScreenWidth = (self.view.bounds.width - 42) / 2
        
        
        
        self.view.addSubview(designLabel)
        designLabel.translatesAutoresizingMaskIntoConstraints = false
        designLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        designLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.safeAreaInsets.top).isActive = true
        designLabel.widthAnchor.constraint(equalToConstant: halfOfScreenWidth ).isActive = true
        designLabel.heightAnchor.constraint(equalTo: designLabel.widthAnchor, multiplier: 0.3).isActive = true
        designLabel.textColor = UIColor.black
        designLabel.text = "□ □ □ □"
        designLabel.textAlignment = NSTextAlignment.center
        designLabel.font = UIFont.systemFont(ofSize: 35)
        designLabel.adjustsFontSizeToFitWidth = true
        
        
        self.view.addSubview(timerLabel)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        timerLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.safeAreaInsets.top).isActive = true
        timerLabel.widthAnchor.constraint(equalTo: designLabel.widthAnchor).isActive = true
        timerLabel.heightAnchor.constraint(equalTo: designLabel.heightAnchor).isActive = true
        timerLabel.textColor = UIColor.black
        timerLabel.text = "00:00.00"
        timerLabel.textAlignment = NSTextAlignment.center
        timerLabel.font = UIFont.systemFont(ofSize: 35)
        timerLabel.adjustsFontSizeToFitWidth = true
        
        
        let lengthOfScreenAndButton = self.view.bounds.width / 15
        let widthOfButton = self.view.bounds.width / 5
        
        self.view.addSubview(backToMenuButton)
        backToMenuButton.translatesAutoresizingMaskIntoConstraints = false
        backToMenuButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: lengthOfScreenAndButton).isActive = true
        backToMenuButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.view.safeAreaInsets.bottom).isActive = true
        backToMenuButton.widthAnchor.constraint(equalToConstant: widthOfButton).isActive = true
        backToMenuButton.heightAnchor.constraint(equalTo: backToMenuButton.widthAnchor).isActive = true
        backToMenuButton.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        backToMenuButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        backToMenuButton.setTitle("戻る", for: .normal)
        backToMenuButton.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        backToMenuButton.titleLabel?.adjustsFontSizeToFitWidth = true
        backToMenuButton.layer.cornerRadius = backToMenuButton.bounds.width / 2
        backToMenuButton.tag = 0
        backToMenuButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        self.view.addSubview(startButtom)
        startButtom.translatesAutoresizingMaskIntoConstraints = false
        startButtom.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        startButtom.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.view.safeAreaInsets.bottom).isActive = true
        startButtom.widthAnchor.constraint(equalTo: backToMenuButton.widthAnchor).isActive = true
        startButtom.heightAnchor.constraint(equalTo: backToMenuButton.widthAnchor).isActive = true
        startButtom.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        startButtom.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        startButtom.setTitle("スタート", for: .normal)
        startButtom.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        startButtom.titleLabel?.adjustsFontSizeToFitWidth = true
        startButtom.layer.cornerRadius = backToMenuButton.bounds.width / 2
        startButtom.tag = 1
        startButtom.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        self.view.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -lengthOfScreenAndButton).isActive = true
        resetButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.view.safeAreaInsets.bottom).isActive = true
        resetButton.widthAnchor.constraint(equalTo: backToMenuButton.widthAnchor).isActive = true
        resetButton.heightAnchor.constraint(equalTo: backToMenuButton.widthAnchor).isActive = true
        resetButton.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        resetButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        resetButton.setTitle("リセット", for: .normal)
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        resetButton.titleLabel?.adjustsFontSizeToFitWidth = true
        resetButton.layer.cornerRadius = backToMenuButton.bounds.width / 2
        resetButton.tag = 2
        resetButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        self.view.addSubview(enterdInformationLabel)
        enterdInformationLabel.translatesAutoresizingMaskIntoConstraints = false
        enterdInformationLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        enterdInformationLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        enterdInformationLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        enterdInformationLabel.bottomAnchor.constraint(equalTo: backToMenuButton.topAnchor, constant: -10).isActive = true
        enterdInformationLabel.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
        enterdInformationLabel.text = "スタートボタンを押して下さい"
        enterdInformationLabel.textColor = UIColor.black
        enterdInformationLabel.font = enterdInformationLabel.font.withSize(35)
        enterdInformationLabel.adjustsFontSizeToFitWidth = true

        
        let widthOfNumberButton = (self.view.bounds.width - 60) / 6
        
        
        self.view.addSubview(okButton)
        okButton.translatesAutoresizingMaskIntoConstraints = false
        okButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        okButton.bottomAnchor.constraint(equalTo: enterdInformationLabel.topAnchor, constant: -5).isActive = true
        okButton.widthAnchor.constraint(equalToConstant: widthOfNumberButton).isActive = true
        okButton.heightAnchor.constraint(equalToConstant: widthOfNumberButton).isActive = true
        okButton.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        okButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        okButton.setTitle("OK", for: .normal)
        okButton.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        okButton.titleLabel?.adjustsFontSizeToFitWidth = true
        okButton.tag = 3
        okButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        self.view.addSubview(button0)
        button0.translatesAutoresizingMaskIntoConstraints = false
        button0.trailingAnchor.constraint(equalTo: okButton.leadingAnchor, constant: -4).isActive = true
        button0.bottomAnchor.constraint(equalTo: enterdInformationLabel.topAnchor, constant: -5).isActive = true
        button0.widthAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button0.heightAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button0.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        button0.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        button0.setTitle("0", for: .normal)
        button0.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button0.titleLabel?.adjustsFontSizeToFitWidth = true
        button0.tag = 4
        button0.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        self.view.addSubview(button9)
        button9.translatesAutoresizingMaskIntoConstraints = false
        button9.trailingAnchor.constraint(equalTo: button0.leadingAnchor, constant: -4).isActive = true
        button9.bottomAnchor.constraint(equalTo: enterdInformationLabel.topAnchor, constant: -5).isActive = true
        button9.widthAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button9.heightAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button9.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        button9.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        button9.setTitle("9", for: .normal)
        button9.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button9.titleLabel?.adjustsFontSizeToFitWidth = true
        button9.tag = 5
        button9.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        self.view.addSubview(button8)
        button8.translatesAutoresizingMaskIntoConstraints = false
        button8.trailingAnchor.constraint(equalTo: button9.leadingAnchor, constant: -4).isActive = true
        button8.bottomAnchor.constraint(equalTo: enterdInformationLabel.topAnchor, constant: -5).isActive = true
        button8.widthAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button8.heightAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button8.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        button8.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        button8.setTitle("8", for: .normal)
        button8.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button8.titleLabel?.adjustsFontSizeToFitWidth = true
        button8.tag = 6
        button8.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        self.view.addSubview(button7)
        button7.translatesAutoresizingMaskIntoConstraints = false
        button7.trailingAnchor.constraint(equalTo: button8.leadingAnchor, constant: -4).isActive = true
        button7.bottomAnchor.constraint(equalTo: enterdInformationLabel.topAnchor, constant: -5).isActive = true
        button7.widthAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button7.heightAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button7.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        button7.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        button7.setTitle("7", for: .normal)
        button7.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button7.titleLabel?.adjustsFontSizeToFitWidth = true
        button7.tag = 7
        button7.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        self.view.addSubview(button6)
        button6.translatesAutoresizingMaskIntoConstraints = false
        button6.trailingAnchor.constraint(equalTo: button7.leadingAnchor, constant: -4).isActive = true
        button6.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        button6.bottomAnchor.constraint(equalTo: enterdInformationLabel.topAnchor, constant: -5).isActive = true
        button6.widthAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button6.heightAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button6.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        button6.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        button6.setTitle("6", for: .normal)
        button6.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button6.titleLabel?.adjustsFontSizeToFitWidth = true
        button6.tag = 8
        button6.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        self.view.addSubview(deleteButton)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        //deleteButton.leadingAnchor.constraint(equalTo: button5.trailingAnchor, constant: 4).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo: okButton.topAnchor, constant: -5).isActive = true
        deleteButton.widthAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        deleteButton.heightAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        deleteButton.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        deleteButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        deleteButton.setTitle("×", for: .normal)
        deleteButton.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        deleteButton.titleLabel?.adjustsFontSizeToFitWidth = true
        deleteButton.tag = 9
        deleteButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        self.view.addSubview(button5)
        button5.translatesAutoresizingMaskIntoConstraints = false
        button5.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -4).isActive = true
        //button5.leadingAnchor.constraint(equalTo: button4.trailingAnchor, constant: 4).isActive = true
        button5.bottomAnchor.constraint(equalTo: okButton.topAnchor, constant: -5).isActive = true
        button5.widthAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button5.heightAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button5.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        button5.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        button5.setTitle("5", for: .normal)
        button5.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button5.titleLabel?.adjustsFontSizeToFitWidth = true
        button5.tag = 10
        button5.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        self.view.addSubview(button4)
        button4.translatesAutoresizingMaskIntoConstraints = false
        button4.trailingAnchor.constraint(equalTo: button5.leadingAnchor, constant: -4).isActive = true
        //button4.leadingAnchor.constraint(equalTo: button3.trailingAnchor, constant: 4).isActive = true
        button4.bottomAnchor.constraint(equalTo: okButton.topAnchor, constant: -5).isActive = true
        button4.widthAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button4.heightAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button4.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        button4.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        button4.setTitle("4", for: .normal)
        button4.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button4.titleLabel?.adjustsFontSizeToFitWidth = true
        button4.tag = 11
        button4.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        self.view.addSubview(button3)
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.trailingAnchor.constraint(equalTo: button4.leadingAnchor, constant: -4).isActive = true
        //button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: 4).isActive = true
        button3.bottomAnchor.constraint(equalTo: okButton.topAnchor, constant: -5).isActive = true
        button3.widthAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button3.heightAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button3.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        button3.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        button3.setTitle("3", for: .normal)
        button3.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button3.titleLabel?.adjustsFontSizeToFitWidth = true
        button3.tag = 12
        button3.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        self.view.addSubview(button2)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.trailingAnchor.constraint(equalTo: button3.leadingAnchor, constant: -4).isActive = true
        //button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: 4).isActive = true
        button2.bottomAnchor.constraint(equalTo: okButton.topAnchor, constant: -5).isActive = true
        button2.widthAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button2.heightAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button2.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        button2.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        button2.setTitle("2", for: .normal)
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button2.titleLabel?.adjustsFontSizeToFitWidth = true
        button2.tag = 13
        button2.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        self.view.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.trailingAnchor.constraint(equalTo: button2.leadingAnchor, constant: -4).isActive = true
        button1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        button1.bottomAnchor.constraint(equalTo: okButton.topAnchor, constant: -5).isActive = true
        button1.widthAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button1.heightAnchor.constraint(equalTo: okButton.widthAnchor).isActive = true
        button1.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        button1.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        button1.setTitle("1", for: .normal)
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button1.titleLabel?.adjustsFontSizeToFitWidth = true
        button1.tag = 14
        button1.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        let widthOfTableView = (self.view.bounds.width - 42) / 2
        
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        tableView.topAnchor.constraint(equalTo: designLabel.bottomAnchor, constant: 5).isActive = true
        tableView.bottomAnchor.constraint(equalTo: button1.topAnchor, constant: -5).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: widthOfTableView).isActive = true
                // sampleTableView の dataSource 問い合わせ先を self に
        tableView.delegate = self
                // sampleTableView の delegate 問い合わせ先を self に
        tableView.dataSource = self
                //cellに名前を付ける
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
                //セパレーターの色を指定
        tableView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
        tableView.separatorColor = UIColor.black
        
        
        self.view.addSubview(showImageTA)
        showImageTA.contentMode = .scaleAspectFit
        showImageTA.translatesAutoresizingMaskIntoConstraints = false
        showImageTA.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        showImageTA.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 5).isActive = true
        showImageTA.bottomAnchor.constraint(equalTo: deleteButton.topAnchor, constant: -5).isActive = true
        showImageTA.widthAnchor.constraint(equalTo: tableView.widthAnchor ).isActive = true
        showImageTA.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
        
    }
    
    
    @objc func buttonTapped(_ sender : Any) {
        switch (sender as AnyObject).tag{
        case 0:
            if timer != nil{
                timer.invalidate()
            }
            appDelegate.audioPlayerOfGame.stop()
            appDelegate.audioPlayerOfGame.currentTime = 0
            dismiss(animated: true, completion: nil)
            appDelegate.audioPlayer.play()
        case 1:
            if trueNumbersArray.count == 0{
                showImageTA.isHidden = false
                counterEnabled()
                rowCounter = 0
                enterdInformationLabel.text = "数字をタップして入力"
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
        case 2:
            reset()
        case 3:
            if inputNumbersArray.count == 4 && rowCounter != -1{
                checkNumbers(inputNum: self.inputNumbersArray, trueNum: self.trueNumbersArray)
            }
        case 4:
            if counter0 == 0{
                judgeNumber(num: 0)
                counter0 += 1
                addButtonCounter()
                if sum <= 4{
                    button0.setTitleColor(UIColor.gray, for: .normal)
                }
            }
        case 5:
            if counter9 == 0{
                judgeNumber(num: 9)
                counter9 += 1
                addButtonCounter()
                if sum <= 4{
                    button9.setTitleColor(UIColor.gray, for: .normal)
                }
            }
        case 6:
            if counter8 == 0{
                judgeNumber(num: 8)
                counter8 += 1
                addButtonCounter()
                if sum <= 4{
                    button8.setTitleColor(UIColor.gray, for: .normal)
                }
            }
        case 7:
            if counter7 == 0{
                judgeNumber(num: 7)
                counter7 += 1
                addButtonCounter()
                if sum <= 4{
                    button7.setTitleColor(UIColor.gray, for: .normal)
                }
            }
        case 8:
            if counter6 == 0{
                judgeNumber(num: 6)
                counter6 += 1
                addButtonCounter()
                if sum <= 4{
                    button6.setTitleColor(UIColor.gray, for: .normal)
                }
            }
        case 9:
            if inputNumbersArray.count > 0 && rowCounter != -1{
                inputNumbersArray.removeAll()
                counterEnabled()
                enterdInformationLabel.text = "数字をタップして入力"
                counterEnabled()
                buttonTitleColor()
            }
        case 10:
            if counter5 == 0{
                judgeNumber(num: 5)
                counter5 += 1
                addButtonCounter()
                if sum <= 4{
                    button5.setTitleColor(UIColor.gray, for: .normal)
                }
            }
        case 11:
            if counter4 == 0{
                judgeNumber(num: 4)
                counter4 += 1
                addButtonCounter()
                if sum <= 4{
                    button4.setTitleColor(UIColor.gray, for: .normal)
                }
            }
        case 12:
            if counter3 == 0{
                judgeNumber(num: 3)
                counter3 += 1
                addButtonCounter()
                if sum <= 4{
                    button3.setTitleColor(UIColor.gray, for: .normal)
                }
            }
        case 13:
            if counter2 == 0{
                judgeNumber(num: 2)
                counter2 += 1
                addButtonCounter()
                if sum <= 4{
                    button2.setTitleColor(UIColor.gray, for: .normal)
                }
            }
        case 14:
            if counter1 == 0{
                judgeNumber(num: 1)
                counter1 += 1
                addButtonCounter()
                if sum <= 4{
                    button1.setTitleColor(UIColor.gray, for: .normal)
                }
            }
        default:
            break
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
        enterdInformationLabel.text = inputNumStr.joined(separator: " ") //文字列に変換
    }
    
    
    @objc func timerCounter() {
        // タイマー開始からのインターバル時間
        currentTime = Date().timeIntervalSince(startTime)
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
        
        timerLabel.text = sMinute + ":" + sSecond + "." + sMsec
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
            enterdInformationLabel.text = "数字をタップして入力"
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
        timerLabel.text = "00:00.00"
        inputNumbersArray.removeAll()
        trueNumbersArray.removeAll()
        resultsUpdatedInTableView.removeAll()
        resultspassedArray.removeAll()
        tableView.reloadData()
        counterUnEnabled()
        buttonTitleColor()
        sum = 0
        enterdInformationLabel.text = "スタートを押して下さい"
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
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsUpdatedInTableView.count
    }    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
        cell.textLabel!.text = resultsUpdatedInTableView[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
    }
}
