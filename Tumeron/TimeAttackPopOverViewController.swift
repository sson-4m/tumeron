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
        
        
         
        do {
            let filePath = Bundle.main.path(forResource: "clear",ofType: "mp3")
            let musicPath = URL(fileURLWithPath: filePath!)
            audioPlayer4 = try AVAudioPlayer(contentsOf: musicPath)
            audioPlayer4.play()
        } catch {
            print("error")
        }
        clearImageView.image =  UIImage(named:"tumeron-clear")
        clearTimeLabel.text = "クリアタイム：　" + text1
        numberOfTrialsLabel.text = "　　試行回数：　"  + text2 + "回"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let screenWidth:CGFloat = self.view.frame.width
        
        /*
        timeAttackHistoryButton.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        timeAttackHistoryButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        timeAttackHistoryButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        timeAttackHistoryButton.titleLabel?.adjustsFontSizeToFitWidth = true
        timeAttackHistoryButton.setTitle("記録", for: .normal)
        timeAttackHistoryButton.layer.cornerRadius = 15
        self.mainView.addSubview(timeAttackHistoryButton)
        timeAttackHistoryButton.translatesAutoresizingMaskIntoConstraints = false
        timeAttackHistoryButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        timeAttackHistoryButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: self.view.safeAreaInsets.top).isActive = true
        timeAttackHistoryButton.widthAnchor.constraint(equalToConstant: screenWidth / 5.1).isActive = true
        timeAttackHistoryButton.heightAnchor.constraint(equalToConstant: screenWidth / 8.5).isActive = true
        timeAttackHistoryButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        */
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToHistoryView"{
            let TimeAttackHistoryViewController = segue.destination as! TimeAttackHistoryViewController
            let viewJudgeNum = 2
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
