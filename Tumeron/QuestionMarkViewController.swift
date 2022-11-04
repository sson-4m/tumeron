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
    
    /*
     var playerController = AVPlayerViewController()
     var player = AVPlayer()
     */
    
    var helpMenuLabel: UILabel = UILabel()
    var howToPlayButton: UIButton = UIButton()
    var homePageButton: UIButton = UIButton()
    var backToMenuButton: UIButton = UIButton()
    
    var timeAttackHistoryButton: UIButton = UIButton()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToHistoryViewFromVC"{
            let TimeAttackHistoryViewController = segue.destination as! TimeAttackHistoryViewController
            let viewJudgeNum = 1
            TimeAttackHistoryViewController.viewNumber = viewJudgeNum
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
        /*
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
         */
    }
    
    override func viewWillLayoutSubviews() {
        
        helpMenuLabel.textColor = UIColor.brown
        helpMenuLabel.text = "ヘルプメニュー"
        helpMenuLabel.textAlignment = NSTextAlignment.center
        helpMenuLabel.font = UIFont.systemFont(ofSize: 35)
        helpMenuLabel.adjustsFontSizeToFitWidth = true
        self.view.addSubview(helpMenuLabel)
        helpMenuLabel.translatesAutoresizingMaskIntoConstraints = false
        helpMenuLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        helpMenuLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.safeAreaInsets.top + self.view.frame.width * 0.2).isActive = true
        helpMenuLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        //        helpMenuLabel.heightAnchor.constraint(equalTo: homePageButton.heightAnchor).isActive = true
        
        
        howToPlayButton.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        howToPlayButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        howToPlayButton.setTitle("ゲームの遊び方", for: .normal)
        howToPlayButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        howToPlayButton.titleLabel?.adjustsFontSizeToFitWidth = true
        howToPlayButton.layer.cornerRadius = 15
        self.view.addSubview(howToPlayButton)
        howToPlayButton.translatesAutoresizingMaskIntoConstraints = false
        howToPlayButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        howToPlayButton.topAnchor.constraint(equalTo: helpMenuLabel.bottomAnchor, constant:  self.view.frame.width / 5).isActive = true
        howToPlayButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        howToPlayButton.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.12).isActive = true
        howToPlayButton.tag = 1
        howToPlayButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        homePageButton.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        homePageButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        homePageButton.setTitle("SSONの活動紹介", for: .normal)
        homePageButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        homePageButton.titleLabel?.adjustsFontSizeToFitWidth = true
        homePageButton.layer.cornerRadius = 15
        self.view.addSubview(homePageButton)
        homePageButton.translatesAutoresizingMaskIntoConstraints = false
        homePageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        homePageButton.topAnchor.constraint(equalTo: howToPlayButton.bottomAnchor, constant:  self.view.bounds.width / 7).isActive = true
        homePageButton.widthAnchor.constraint(equalTo: howToPlayButton.widthAnchor).isActive = true
        homePageButton.heightAnchor.constraint(equalTo: howToPlayButton.heightAnchor).isActive = true
        homePageButton.tag = 2
        homePageButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        /*
        timeAttackHistoryButton.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        timeAttackHistoryButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        timeAttackHistoryButton.setTitle("タイムアタックの記録", for: .normal)
        timeAttackHistoryButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        timeAttackHistoryButton.titleLabel?.adjustsFontSizeToFitWidth = true
        timeAttackHistoryButton.layer.cornerRadius = 15
        self.view.addSubview(timeAttackHistoryButton)
        timeAttackHistoryButton.translatesAutoresizingMaskIntoConstraints = false
        timeAttackHistoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeAttackHistoryButton.topAnchor.constraint(equalTo: homePageButton.bottomAnchor, constant: self.view.bounds.width / 7).isActive = true
        timeAttackHistoryButton.widthAnchor.constraint(equalTo: homePageButton.widthAnchor).isActive = true
        timeAttackHistoryButton.heightAnchor.constraint(equalTo: homePageButton.heightAnchor).isActive = true
        timeAttackHistoryButton.tag = 0
        timeAttackHistoryButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        */
        
        
        self.view.addSubview(backToMenuButton)
        backToMenuButton.translatesAutoresizingMaskIntoConstraints = false
        backToMenuButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        backToMenuButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.view.safeAreaInsets.bottom).isActive = true
        backToMenuButton.widthAnchor.constraint(equalToConstant: self.view.frame.width / 6).isActive = true
        backToMenuButton.heightAnchor.constraint(equalToConstant: self.view.frame.width / 6).isActive = true
        backToMenuButton.tag = 3
        backToMenuButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        //https://icon-rainbow.com/ターン・バックするの矢印アイコン素材-2/
        backToMenuButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        backToMenuButton.layer.borderWidth = 1.0
        backToMenuButton.layer.borderColor = CGColor(red: 80/255, green: 80/255, blue: 80/255, alpha: 1.0)
        backToMenuButton.setImage(UIImage(named: "returnImage1"), for: .normal)
        backToMenuButton.imageView?.contentMode = .scaleAspectFill
        backToMenuButton.contentHorizontalAlignment = .fill
        backToMenuButton.contentVerticalAlignment = .fill
        backToMenuButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10);
        backToMenuButton.layer.cornerRadius = backToMenuButton.bounds.width / 2
        
    }
    
    @objc func buttonTapped(_ sender : Any) {
        switch (sender as AnyObject).tag{
        case 0:
            appDelegate.audioPlayer.stop()
            appDelegate.audioPlayer.currentTime = 0
            performSegue(withIdentifier: "segueToHistoryViewFromVC", sender: nil)
        case 1:
            performSegue(withIdentifier: "segueToHowToUseViewController", sender: nil)
        case 2:
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
        default:
            dismiss(animated: true, completion: nil)
            appDelegate.audioPlayer.play()
        }
    }
    
    /*
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
     */
}
