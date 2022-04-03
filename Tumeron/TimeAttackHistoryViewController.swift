//
//  TimeAttackHistoryViewController.swift
//  Tumeron
//
//  Created by 須藤裕功 on 2022/01/15.
//

import UIKit

class TimeAttackHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var timeAttackHistoryArray: [String] = []
    var viewNumber: Int = 0
    
    var Label1: UILabel = UILabel()
    var bestTimeLabel: UILabel = UILabel()
    var worstTimeLabel: UILabel = UILabel()
    var meanTimeLabel: UILabel = UILabel()
    var Label5: UILabel = UILabel()
    var Label6: UILabel = UILabel()
    var Label7: UILabel = UILabel()
    
    var timeView: UIView = UIView()
    var timeLabel: UILabel = UILabel()
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var tableView: UITableView = UITableView()
    var tableViewCell: UITableViewCell = UITableViewCell()
    var backToMenuButton: UIButton = UIButton()
    var replayButton: UIButton = UIButton()
    var backButton: UIButton = UIButton()
    var closeTimeViewButton: UIButton = UIButton()
    
    var data: [String] = []
    var time:[String] = []
    
    var minute = 0
    var second = 0
    var msec = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = UserDefaults.standard.stringArray(forKey: "score") ?? []
        time = UserDefaults.standard.stringArray(forKey: "time") ?? []
        var i = 0
        while i < self.data.count{
            timeAttackHistoryArray.append("\(i + 1)  " + self.data[i])
            i += 1
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        Label1.text = "タイムアタックの記録"
        Label1.font = Label1.font.withSize(25)
        Label1.tintColor = UIColor.black
        Label1.textAlignment = .center
        Label1.adjustsFontSizeToFitWidth = true
        self.view.addSubview(Label1)
        Label1.translatesAutoresizingMaskIntoConstraints = false
        Label1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        Label1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.safeAreaInsets.top + 20).isActive = true
        Label1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        //        Label1.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
        
        
        bestTimeLabel.text = "ベストタイム:"
        bestTimeLabel.font = bestTimeLabel.font.withSize(20)
        bestTimeLabel.tintColor = UIColor.red
        bestTimeLabel.textAlignment = .right
        bestTimeLabel.adjustsFontSizeToFitWidth = true
        self.view.addSubview(bestTimeLabel)
        bestTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        bestTimeLabel.topAnchor.constraint(equalTo: Label1.bottomAnchor, constant: 20).isActive = true
        bestTimeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        bestTimeLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        
        
        worstTimeLabel.text = "ワーストタイム:"
        worstTimeLabel.font = worstTimeLabel.font.withSize(20)
        worstTimeLabel.tintColor = UIColor.purple
        worstTimeLabel.textAlignment = .right
        worstTimeLabel.adjustsFontSizeToFitWidth = true
        self.view.addSubview(worstTimeLabel)
        worstTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        worstTimeLabel.topAnchor.constraint(equalTo: bestTimeLabel.bottomAnchor, constant: 10).isActive = true
        worstTimeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        worstTimeLabel.widthAnchor.constraint(equalTo: bestTimeLabel.widthAnchor).isActive = true
        
        
        meanTimeLabel.text = "平均:"
        meanTimeLabel.font = meanTimeLabel.font.withSize(20)
        meanTimeLabel.tintColor = UIColor.black
        meanTimeLabel.textAlignment = .right
        meanTimeLabel.adjustsFontSizeToFitWidth = true
        self.view.addSubview(meanTimeLabel)
        meanTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        meanTimeLabel.topAnchor.constraint(equalTo: worstTimeLabel.bottomAnchor, constant: 10).isActive = true
        meanTimeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        meanTimeLabel.widthAnchor.constraint(equalTo: bestTimeLabel.widthAnchor).isActive = true
        
        
        Label5.text = "1"
        Label5.font = Label5.font.withSize(22)
        Label5.tintColor = UIColor.red
        Label5.textAlignment = .left
        Label5.adjustsFontSizeToFitWidth = true
        self.view.addSubview(Label5)
        Label5.translatesAutoresizingMaskIntoConstraints = false
        Label5.centerYAnchor.constraint(equalTo: bestTimeLabel.centerYAnchor).isActive = true
        Label5.topAnchor.constraint(equalTo: Label1.bottomAnchor, constant: 20).isActive = true
        Label5.leadingAnchor.constraint(equalTo: bestTimeLabel.trailingAnchor, constant: 20).isActive = true
        Label5.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        
        
        Label6.text = "1"
        Label6.font = Label6.font.withSize(22)
        Label6.tintColor = UIColor.red
        Label6.textAlignment = .left
        Label6.adjustsFontSizeToFitWidth = true
        self.view.addSubview(Label6)
        Label6.translatesAutoresizingMaskIntoConstraints = false
        Label6.centerYAnchor.constraint(equalTo: worstTimeLabel.centerYAnchor).isActive = true
        Label6.leadingAnchor.constraint(equalTo: worstTimeLabel.trailingAnchor, constant: 20).isActive = true
        Label6.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        
        
        Label7.text = "1"
        Label7.font = Label7.font.withSize(22)
        Label7.tintColor = UIColor.red
        Label7.textAlignment = .left
        Label7.adjustsFontSizeToFitWidth = true
        self.view.addSubview(Label7)
        Label7.translatesAutoresizingMaskIntoConstraints = false
        Label7.centerYAnchor.constraint(equalTo: meanTimeLabel.centerYAnchor).isActive = true
        Label7.leadingAnchor.constraint(equalTo: meanTimeLabel.trailingAnchor, constant: 20).isActive = true
        Label7.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        
        
        
        backToMenuButton.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        if viewNumber == 1{
            backToMenuButton.setTitle("ヘルプメニュー", for: .normal)
        }else if viewNumber == 2{
            backToMenuButton.setTitle("メニューに戻る", for: .normal)
        }
        backToMenuButton.setTitleColor(UIColor(red: 255/255, green: 226/255, blue: 128/255, alpha: 1.0), for: .normal)
        backToMenuButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        backToMenuButton.titleLabel?.adjustsFontSizeToFitWidth = true
        backToMenuButton.layer.cornerRadius = 10
        self.view.addSubview(backToMenuButton)
        backToMenuButton.translatesAutoresizingMaskIntoConstraints = false
        backToMenuButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        backToMenuButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.view.safeAreaInsets.bottom).isActive = true
        backToMenuButton.heightAnchor.constraint(equalToConstant: screenWidth / 8.5).isActive = true
        backToMenuButton.widthAnchor.constraint(equalToConstant: screenWidth / 3.2).isActive = true
        backToMenuButton.tag = 0
        backToMenuButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        if viewNumber == 2{
            replayButton.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
            replayButton.setTitleColor(UIColor(red: 255/255, green: 226/255, blue: 128/255, alpha: 1.0), for: .normal)
            replayButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
            replayButton.titleLabel?.adjustsFontSizeToFitWidth = true
            replayButton.setTitle("リプレイ", for: .normal)
            replayButton.layer.cornerRadius = 10
            self.view.addSubview(replayButton)
            replayButton.translatesAutoresizingMaskIntoConstraints = false
            replayButton.leftAnchor.constraint(equalTo: backToMenuButton.rightAnchor, constant: 10).isActive = true
            replayButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
            replayButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.view.safeAreaInsets.bottom).isActive = true
            replayButton.heightAnchor.constraint(equalTo: backToMenuButton.heightAnchor).isActive = true
            //            replayButton.widthAnchor.constraint(equalToConstant: screenWidth / 5).isActive = true
            replayButton.tag = 1
            replayButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
            
            
            backButton.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
            backButton.setTitleColor(UIColor(red: 255/255, green: 226/255, blue: 128/255, alpha: 1.0), for: .normal)
            backButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
            backButton.titleLabel?.adjustsFontSizeToFitWidth = true
            backButton.setTitle("戻る", for: .normal)
            backButton.layer.cornerRadius = 10
            self.view.addSubview(backButton)
            backButton.translatesAutoresizingMaskIntoConstraints = false
            backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
            backButton.rightAnchor.constraint(equalTo: backToMenuButton.leftAnchor, constant: -10).isActive = true
            backButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.view.safeAreaInsets.bottom).isActive = true
            backButton.heightAnchor.constraint(equalTo: backToMenuButton.heightAnchor).isActive = true
            //            backButton.widthAnchor.constraint(equalToConstant: screenWidth / 5).isActive = true
            backButton.tag = 2
            backButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        }
        
        tableView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
        tableView.addSubview(tableViewCell)
        tableView.delegate = self
        // tableView の delegate 問い合わせ先を self に
        tableView.dataSource = self
        //cellに名前を付ける
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //実際にviewにtableViewを表示させる
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: meanTimeLabel.bottomAnchor, constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: backToMenuButton.topAnchor, constant: -20).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        
        timeView.center = view.center
        timeView.layer.cornerRadius = 15
        timeView.isHidden = true
        timeView.backgroundColor = UIColor(red: 247/255, green: 255/255, blue: 239/255, alpha: 1.0)
        timeView.layer.borderWidth = 3.5
        timeView.layer.borderColor = UIColor.orange.cgColor
        self.view.addSubview(timeView)
        timeView.translatesAutoresizingMaskIntoConstraints = false
        timeView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        timeView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        timeView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        timeView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6).isActive = true
        
        
        timeLabel.text = "1"
        timeLabel.font = timeLabel.font.withSize(24)
        timeLabel.numberOfLines = 1
        timeLabel.tintColor = UIColor.black
        timeLabel.textAlignment = .center
        timeLabel.adjustsFontSizeToFitWidth = true
        timeView.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: timeView.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: timeView.topAnchor, constant: 20).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: timeView.trailingAnchor, constant: 20).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: timeView.rightAnchor, constant: -20).isActive = true
        
        
        closeTimeViewButton.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
//        closeTimeViewButton.setTitleColor(UIColor(red: 255/255, green: 226/255, blue: 128/255, alpha: 1.0), for: .normal)
        closeTimeViewButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        closeTimeViewButton.titleLabel?.adjustsFontSizeToFitWidth = true
        closeTimeViewButton.setTitle("✖️", for: .normal)
        closeTimeViewButton.layer.cornerRadius = 10
        timeView.addSubview(closeTimeViewButton)
        closeTimeViewButton.translatesAutoresizingMaskIntoConstraints = false
//        closeTimeViewButton.centerXAnchor.constraint(equalTo: timeView.centerXAnchor).isActive = true
        closeTimeViewButton.rightAnchor.constraint(equalTo: timeView.rightAnchor, constant: -10).isActive = true
        closeTimeViewButton.topAnchor.constraint(equalTo: timeView.topAnchor, constant: 10).isActive = true
//        closeTimeViewButton.bottomAnchor.constraint(equalTo: timeView.bottomAnchor, constant: -20).isActive = true
        closeTimeViewButton.heightAnchor.constraint(equalTo: timeView.widthAnchor, multiplier: 0.1).isActive = true
        closeTimeViewButton.widthAnchor.constraint(equalTo: closeTimeViewButton.heightAnchor).isActive = true
        closeTimeViewButton.tag = 3
        closeTimeViewButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc func buttonTapped(_ sender : Any) {
        
        
        if viewNumber == 2{//タイムアタックの後にアクセス
            guard let tapoVc = self.presentingViewController as? TimeAttackPopOverViewController else {return}
            switch (sender as AnyObject).tag{
            case 0:
                tapoVc.dismiss(animated: false, completion: nil)
                tapoVc.backToMenuButton(UIButton())
            case 1:
                tapoVc.dismiss(animated: false, completion: nil)
                tapoVc.replayButton(UIButton())
            case 2:
                dismiss(animated: true, completion: nil)
            default:
                timeView.isHidden = true
            }
            
        }else{
            switch (sender as AnyObject).tag{
            case 0:
                dismiss(animated: true, completion: nil)
            default:
                timeView.isHidden = true
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    func numberOfSections(in sampleTableView: UITableView) -> Int {
        return 1
    }
    //表示するcellの数を指定
    func tableView(_ sampleTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
        return timeAttackHistoryArray.count
    }
    //cellのコンテンツ
    func tableView(_ sampleTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        //cellにはtimeAttackHistoryArrayが一つずつ入るようにするよ！
        cell.textLabel?.text = timeAttackHistoryArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
    }
    
    //cellが選択された時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        timeView.isHidden = false
        print("\(indexPath.row)番セルが押されたよ！")
    }
    /*
    //削除機能を追加してみましょう！
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "削除") { (action, index) -> Void in
//            self.timeAttackHistoryArray.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
            self.removeFromArray(num: indexPath[1])
            print(indexPath)
        }
        
        deleteButton.backgroundColor = UIColor.red
        
        tableView.reloadData()
        
        return [deleteButton]
    }
    
    func removeFromArray(num: Int){
        self.data.remove(at: num)
        UserDefaults.standard.set(self.data, forKey: "score")
        var i = 0
        while i < self.data.count{
            timeAttackHistoryArray.append("\(i + 1)  " + self.data[i])
            i += 1
        }
        
    }
    */
}
