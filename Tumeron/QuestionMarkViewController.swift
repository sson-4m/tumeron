//
//  QuestionMarkViewController.swift
//  Tumeron
//
//  Created by 須藤　裕功 on 2021/04/28.
//

import UIKit
import AVFoundation
import MediaPlayer
import AVKit
//import Lottie

class QuestionMarkViewController: UIViewController {
    
//    var animationView: AnimationView = AnimationView()
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var playerController = AVPlayerViewController()
    var player = AVPlayer()
    
    @IBOutlet weak var homePageButton: UIButton!
    var timeAttackHistoryButton: UIButton = UIButton()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "segueToHistoryViewFromVC"{
            let TimeAttackHistoryViewController = segue.destination as! TimeAttackHistoryViewController
            let shownScore: [String] = UserDefaults.standard.array(forKey: "score") as? [String] ?? []
            TimeAttackHistoryViewController.timeAttackHistoryArray = shownScore
            let viewJudgeNum = 1
            TimeAttackHistoryViewController.viewNumber = viewJudgeNum
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Audio sessionを動画再生向けのものに設定し、activeにします
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .moviePlayback)
        } catch {
            
        }
        do {
            try audioSession.setActive(true)
        } catch {
            
        }
        /*
        timeAttackHistoryButton = type(of: timeAttackHistoryButton).init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        timeAttackHistoryButton.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        timeAttackHistoryButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        timeAttackHistoryButton.setTitle("タイムアタックの記録", for: .normal)
        timeAttackHistoryButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        timeAttackHistoryButton.titleLabel?.adjustsFontSizeToFitWidth = true
        timeAttackHistoryButton.layer.cornerRadius = 15
        self.view.addSubview(timeAttackHistoryButton)
        timeAttackHistoryButton.translatesAutoresizingMaskIntoConstraints = false
        timeAttackHistoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeAttackHistoryButton.topAnchor.constraint(equalTo: homePageButton.bottomAnchor, constant: 40).isActive = true
        timeAttackHistoryButton.widthAnchor.constraint(equalTo: homePageButton.widthAnchor).isActive = true
        timeAttackHistoryButton.heightAnchor.constraint(equalTo: homePageButton.heightAnchor).isActive = true
        timeAttackHistoryButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
         */
    }
    
    @objc func buttonTapped(_ sender : Any) {
            appDelegate.audioPlayer.stop()
            appDelegate.audioPlayer.currentTime = 0
            performSegue(withIdentifier: "segueToHistoryViewFromVC", sender: nil)
    }
    
    @IBAction func playVideoButton(_ sender: UIButton) {
        playMovie(fileName: "hit-explanation", fileExtension: "mp4")
    }
    
    /// 動画プレイヤーにアイテムをセットして更新
    private func playMovie(fileName: String, fileExtension: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("Url is nil")
            return
        }
        
        // AVPlayerにアイテムをセット
        let item = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: item)
        
        // 動画プレイヤーにplayerをセット
        playerController.player = player
        
        // 動画プレイヤーを表示して再生
        self.present(playerController, animated: true) {
            self.player.play()
        }
    }
    
    @IBAction func homePageButton(_ sender: UIButton) {
        
        /*
        let alert = UIAlertController(title: "SSONのホームページは現在製作中です", message: "", preferredStyle: UIAlertController.Style.alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel) {(action) -> Void in
            
        }
        
        alert.addAction(close)
        
        self.present(alert, animated: true, completion: nil)
         */
        
        let url = URL(string: "https://spiritualstateofnothing.jimdofree.com")!
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
         
    }
    
    @IBAction func backToMenuButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        appDelegate.audioPlayer.play()
    }
    
    
}
