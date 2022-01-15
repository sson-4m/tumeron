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
