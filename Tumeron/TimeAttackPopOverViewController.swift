//
//  TimeAttackPopOverViewController.swift
//  Tumeron
//
//  Created by 須藤　裕功 on 2021/04/20.
//

import UIKit
import AVFoundation

class TimeAttackPopOverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var mainView: UIView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var audioPlayer4: AVAudioPlayer!
    
    @IBOutlet weak var clearTimeLabel: UILabel!
    var text1: String = ""
    @IBOutlet weak var numberOfTrialsLabel: UILabel!
    var text2: String = ""
    @IBOutlet weak var clearImageView: UIImageView!
    
    var resultArray: [String] = []
    
    var timeAttackHistoryButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth:CGFloat = self.view.frame.width
        let screenHeight:CGFloat = self.view.frame.height
        
        timeAttackHistoryButton = type(of: timeAttackHistoryButton).init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

        timeAttackHistoryButton.setImage(UIImage(named: "history"), for: .normal)
        
        timeAttackHistoryButton.layer.cornerRadius = 30
        
        self.mainView.addSubview(timeAttackHistoryButton)
        
        timeAttackHistoryButton.translatesAutoresizingMaskIntoConstraints = false
        
        //横方向の位置の制約
        timeAttackHistoryButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        
        //縦方向の位置の制約
        timeAttackHistoryButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 30).isActive = true
        
        timeAttackHistoryButton.widthAnchor.constraint(equalToConstant: screenWidth / 6).isActive = true
        
        timeAttackHistoryButton.heightAnchor.constraint(equalToConstant: screenWidth / 6).isActive = true
        
        timeAttackHistoryButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        do {
            let filePath = Bundle.main.path(forResource: "clear",ofType: "mp3")
            let musicPath = URL(fileURLWithPath: filePath!)
            audioPlayer4 = try AVAudioPlayer(contentsOf: musicPath)
            audioPlayer4.play()
        } catch {
            print("error")
        }
        clearImageView.image =  UIImage(named:"hit5.jpg")
        clearTimeLabel.text = "クリアタイム：　" + text1
        numberOfTrialsLabel.text = "　　試行回数：　"  + text2 + "回"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToHistoryView"{
            let TimeAttackHistoryViewController = segue.destination as! TimeAttackHistoryViewController
            let shownScore: [String] = userDefaults.array(forKey: "score") as? [String] ?? []
            TimeAttackHistoryViewController.timeAttackHistoryArray = shownScore
            let viewJudgeNum = 1
            TimeAttackHistoryViewController.viewNumber = viewJudgeNum
        }
    }
    
    @objc func buttonTapped(_ sender : Any) {
        
        performSegue(withIdentifier: "segueToHistoryView", sender: nil)
    }
    
    @IBAction func backToMenuButton(_ sender: UIButton) {
        audioPlayer4.stop()
        presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        appDelegate.audioPlayer.play()
    }
    
    @IBAction func replayButton(_ sender: UIButton) {
        audioPlayer4.stop()
        dismiss(animated: true, completion: nil)
        appDelegate.audioPlayerOfGame.play()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TAClearScreenCell", for: indexPath)
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        cell.textLabel!.text = resultArray[indexPath.row]
        return cell
    }
}
