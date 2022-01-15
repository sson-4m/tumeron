//
//  ViewController.swift
//  Tumeron
//
//  Created by 須藤　裕功 on 2021/04/18.
//

import UIKit
import AVFoundation

internal class ViewController: UIViewController{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tumeronSelectButton: UIButton!
    @IBOutlet weak var battleSelectButton: UIButton!
    @IBOutlet weak var timeAttackSelectButton: UIButton!
    @IBOutlet var mainView: UIView!
    @IBOutlet var tumeronView: UIView!
    @IBOutlet weak var closeTumeronSelectView: UIButton!
    @IBOutlet var battleView: UIView!
    @IBOutlet weak var closeBattleSelectView: UIButton!
    @IBOutlet weak var questionMarkButton: UIButton!
    
    private var observers: (NSObjectProtocol)?
    
    var heart = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToTumeron"{
            let TumeronLv1ViewController = segue.destination as! TumeronLv1ViewController
            TumeronLv1ViewController.heartCounter = self.heart
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.audioPlayer.play()
        
        let path = Bundle.main.path(forResource: "tumeron-title", ofType: "mp4")!
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        player.play()
        
        let playerLayer = AVPlayerLayer(player: player) // AVPlayer用のLayerを生成
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.zPosition = -1 // ボタン等よりも後ろに表示
        view.layer.insertSublayer(playerLayer, at: 0) // 動画をレイヤーとして追加
        
        let playerObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main) { [weak playerLayer] _ in
            playerLayer?.player?.seek(to: CMTime.zero)
            playerLayer?.player?.play()
        }
        
        observers = (playerObserver)
        
        let rgba1 = UIColor(red: 43/255, green: 40/255, blue: 204/255, alpha: 1.0) // ボタン背景色設定
        tumeronSelectButton.setImage(UIImage(named: "hit-menu1"), for: .normal)
        tumeronSelectButton.backgroundColor = rgba1 // 背景色
        tumeronSelectButton.layer.borderWidth = 0.1 // 枠線の幅
        tumeronSelectButton.layer.cornerRadius = 40 
        tumeronSelectButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        tumeronSelectButton.layer.shadowOpacity = 0.7
        tumeronSelectButton.layer.shadowRadius = 10
        
        let rgba2 = UIColor(red: 214/255, green: 25/255, blue: 25/255, alpha: 1.0) // ボタン背景色設定
        battleSelectButton.setImage(UIImage(named: "hit-menu2"), for: .normal)
        battleSelectButton.backgroundColor = rgba2 // 背景色
        battleSelectButton.layer.borderWidth = 0.1 // 枠線の幅
        battleSelectButton.layer.cornerRadius = 40
        battleSelectButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        battleSelectButton.layer.shadowOpacity = 0.7
        battleSelectButton.layer.shadowRadius = 10
        
        let rgba3 = UIColor(red: 28/255, green: 110/255, blue: 26/255, alpha: 1.0) // ボタン背景色設定
        timeAttackSelectButton.setImage(UIImage(named: "hit-menu3"), for: .normal)
        timeAttackSelectButton.backgroundColor = rgba3 // 背景色
        timeAttackSelectButton.layer.borderWidth = 0.1 // 枠線の幅
        timeAttackSelectButton.layer.cornerRadius = 40
        timeAttackSelectButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        timeAttackSelectButton.layer.shadowOpacity = 0.7
        timeAttackSelectButton.layer.shadowRadius = 10
        
        view.addSubview(tumeronView)
        tumeronView.center = view.center
        tumeronView.isHidden = true
        tumeronView.backgroundColor = UIColor(red: 247/255, green: 255/255, blue: 239/255, alpha: 1.0)
        tumeronView.layer.borderWidth = 3.5
        tumeronView.layer.borderColor = UIColor.orange.cgColor
        
        closeTumeronSelectView.backgroundColor = UIColor(red: 43/255, green: 40/255, blue: 204/255, alpha: 1.0)
        closeTumeronSelectView.tintColor = UIColor.white
        closeTumeronSelectView.layer.cornerRadius = 15
        
        
        view.addSubview(battleView)
        battleView.center = view.center
        battleView.isHidden = true
        battleView.backgroundColor = UIColor(red: 247/255, green: 255/255, blue: 239/255, alpha: 1.0)
        battleView.layer.borderWidth = 3.5
        battleView.layer.borderColor = UIColor.orange.cgColor
        
        closeBattleSelectView.backgroundColor = UIColor(red: 214/255, green: 25/255, blue: 25/255, alpha: 1.0)
        closeBattleSelectView.tintColor = UIColor.white
        closeBattleSelectView.layer.cornerRadius = 15
        
        questionMarkButton.layer.cornerRadius = 35
        
    }
    
    deinit {        // 画面が破棄された時に監視をやめる
        if let observers = observers {
            NotificationCenter.default.removeObserver(observers)
        }
    }
    
    @IBAction func tumeronSelectButton(_ sender: UIButton) {
        questionMarkButton.isEnabled = false
        battleSelectButton.isEnabled = false
        timeAttackSelectButton.isEnabled = false
        tumeronView.isHidden = false
    }
    
    @IBAction func tumeronLv1Button(_ sender: UIButton) {
        buttonEnabled()
        heart = 1
        buttonAction()
    }
    
    @IBAction func tumeronLv2Button(_ sender: UIButton) {
        buttonEnabled()
        heart = 2
        buttonAction()
    }
    
    @IBAction func tumeronLv3Button(_ sender: UIButton) {
        buttonEnabled()
        heart = 3
        buttonAction()
    }
    
    @IBAction func closeTumeronView(_ sender: UIButton) {
        tumeronView.isHidden = true
        questionMarkButton.isEnabled = true
        battleSelectButton.isEnabled = true
        timeAttackSelectButton.isEnabled = true
    }
    
    func buttonAction(){
        appDelegate.audioPlayer.stop()
        appDelegate.audioPlayer.currentTime = 0
        performSegue(withIdentifier: "SegueToTumeron", sender: nil)
        tumeronView.isHidden = true
    }
    
    @IBAction func battleButton(_ sender: UIButton) {
        battleView.isHidden = false
        battleSelectButton.isEnabled = false
        timeAttackSelectButton.isEnabled = false
        questionMarkButton.isEnabled = false
    }
    
    @IBAction func battleVer1Button(_ sender: UIButton) {
        appDelegate.audioPlayer.stop()
        appDelegate.audioPlayer.currentTime = 0
        performSegue(withIdentifier: "SegueToBattleVer1", sender: nil)
        battleView.isHidden = true
        buttonEnabled()
    }
    
    @IBAction func battleVer2Button(_ sender: UIButton) {
        appDelegate.audioPlayer.stop()
        appDelegate.audioPlayer.currentTime = 0
        performSegue(withIdentifier: "SegueToBattleVer2", sender: nil)
        battleView.isHidden = true
        buttonEnabled()
    }
    
    @IBAction func closeBattleSelectButton(_ sender: UIButton) {
        buttonEnabled()
        battleView.isHidden = true
    }
    
    func buttonEnabled(){
        questionMarkButton.isEnabled = true
        battleSelectButton.isEnabled = true
        timeAttackSelectButton.isEnabled = true
    }
    
    @IBAction func timeAttackSelectButton(_ sender: UIButton) {
        appDelegate.audioPlayer.stop()
        appDelegate.audioPlayer.currentTime = 0
        performSegue(withIdentifier: "SegueToTimeAttack", sender: nil)
    }
    
    @IBAction func questionMarkButton(_ sender: UIButton) {
        appDelegate.audioPlayer.stop()
        appDelegate.audioPlayer.currentTime = 0
        performSegue(withIdentifier: "SegueToPopOver", sender: nil)
    }
    
}
