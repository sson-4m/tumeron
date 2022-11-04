//
//  ViewController.swift
//  Tumeron
//
//  Created by 須藤　裕功 on 2021/04/18.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var tumeronView: UIView = UIView()
    var tumeronLabel: UILabel = UILabel()
    var tumeronLv1Button: UIButton = UIButton()
    var tumeronLv2Button: UIButton = UIButton()
    var tumeronLv3Button: UIButton = UIButton()
    var closeTumeronViewButton: UIButton = UIButton()
    
    var battleView: UIView = UIView()
    var battleLabel: UILabel = UILabel()
    var battleVer1Button: UIButton = UIButton()
    var battleVer2Button: UIButton = UIButton()
    var closeBattleViewButton: UIButton = UIButton()
    
    
    private var observers: (NSObjectProtocol)?
    
    var heart = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToTumeron"{
            let TumeronLv1ViewController = segue.destination as! TumeronLv1ViewController
            TumeronLv1ViewController.heartCounter = self.heart
        }
    }
    
    var tumeronSelectButton: UIButton = UIButton()
    var battleSelectButton: UIButton = UIButton()
    var timeAttackSelectButton: UIButton = UIButton()
    var questionMarkButton: UIButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.audioPlayer.play()
//        UserDefaults.standard.set("", forKey: "score")
        
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
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let screenWidth:CGFloat = self.view.frame.width
        
        let border = 0.1// 枠線の幅
        let cornerRadius = self.timeAttackSelectButton.bounds.height / 2
        let shadow1 = CGSize(width: 0, height: 4)//widthで右側に影、heightで下側に影が入る
        let shadow2 = Float(0.7)//影の不透明度、1.0がMAX
        let shadow3 = CGFloat(10)//影の幅、数字が大きいほどぼかしが効く
        
        
        self.view.addSubview(timeAttackSelectButton)
        timeAttackSelectButton.translatesAutoresizingMaskIntoConstraints = false
        timeAttackSelectButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        timeAttackSelectButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75).isActive = true
        timeAttackSelectButton.heightAnchor.constraint(equalToConstant: screenWidth / 3.9).isActive = true
        timeAttackSelectButton.widthAnchor.constraint(equalToConstant: 2 * screenWidth / 3).isActive = true
        timeAttackSelectButton.tag = 2
        timeAttackSelectButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        let rgba3 = UIColor(red: 28/255, green: 110/255, blue: 26/255, alpha: 1.0) // ボタン背景色設定
        timeAttackSelectButton.setImage(UIImage(named: "hit-menu3"), for: .normal)
        timeAttackSelectButton.backgroundColor = rgba3 // 背景色
        timeAttackSelectButton.layer.borderWidth = border // 枠線の幅
        timeAttackSelectButton.layer.cornerRadius = cornerRadius
        timeAttackSelectButton.layer.shadowOffset = shadow1//widthで右側に影、heightで下側に影が入る
        //timeAttackSelectButton.layer.shadowColor = UIColor.orange.cgColor　影の色
        timeAttackSelectButton.layer.shadowOpacity = shadow2//影の不透明度、1.0がMAX
        timeAttackSelectButton.layer.shadowRadius = shadow3//影の幅、数字が大きいほどぼかしが効く
        
        
        self.view.addSubview(battleSelectButton)
        battleSelectButton.translatesAutoresizingMaskIntoConstraints = false
        battleSelectButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        battleSelectButton.bottomAnchor.constraint(equalTo: timeAttackSelectButton.topAnchor, constant:  -15 ).isActive = true
        battleSelectButton.heightAnchor.constraint(equalTo: timeAttackSelectButton.heightAnchor).isActive = true
        battleSelectButton.widthAnchor.constraint(equalTo: timeAttackSelectButton.widthAnchor).isActive = true
        battleSelectButton.tag = 1
        battleSelectButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        let rgba2 = UIColor(red: 214/255, green: 25/255, blue: 25/255, alpha: 1.0) // ボタン背景色設定
        battleSelectButton.setImage(UIImage(named: "hit-menu2"), for: .normal)
        battleSelectButton.backgroundColor = rgba2 // 背景色
        battleSelectButton.layer.borderWidth = border // 枠線の幅
        battleSelectButton.layer.cornerRadius = cornerRadius
        battleSelectButton.layer.shadowOffset = shadow1
        battleSelectButton.layer.shadowOpacity = shadow2
        battleSelectButton.layer.shadowRadius = shadow3
        
        
        self.view.addSubview(tumeronSelectButton)
        tumeronSelectButton.translatesAutoresizingMaskIntoConstraints = false
        tumeronSelectButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tumeronSelectButton.bottomAnchor.constraint(equalTo: battleSelectButton.topAnchor, constant: -15).isActive = true
        tumeronSelectButton.heightAnchor.constraint(equalTo: timeAttackSelectButton.heightAnchor).isActive = true
        tumeronSelectButton.widthAnchor.constraint(equalTo: timeAttackSelectButton.widthAnchor).isActive = true
        tumeronSelectButton.tag = 0
        tumeronSelectButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        let rgba1 = UIColor(red: 43/255, green: 40/255, blue: 204/255, alpha: 1.0) // ボタン背景色設定
        tumeronSelectButton.setImage(UIImage(named: "hit-menu1"), for: .normal)
        tumeronSelectButton.backgroundColor = rgba1 // 背景色
        tumeronSelectButton.layer.borderWidth = border // 枠線の幅
        tumeronSelectButton.layer.cornerRadius = cornerRadius
        tumeronSelectButton.layer.shadowOffset = shadow1
        tumeronSelectButton.layer.shadowOpacity = shadow2
        tumeronSelectButton.layer.shadowRadius = shadow3
        
       
        self.view.addSubview(questionMarkButton)
        questionMarkButton.translatesAutoresizingMaskIntoConstraints = false
        questionMarkButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        questionMarkButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.safeAreaInsets.top).isActive = true
        questionMarkButton.heightAnchor.constraint(equalToConstant: screenWidth / 6).isActive = true
        questionMarkButton.widthAnchor.constraint(equalToConstant: screenWidth / 6).isActive = true
        questionMarkButton.tag = 3
        questionMarkButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        questionMarkButton.setTitle("？", for: .normal)
        questionMarkButton.setTitleColor(UIColor.white, for: .normal)
        questionMarkButton.titleLabel?.font = UIFont.systemFont(ofSize: screenWidth/9)
        questionMarkButton.titleLabel?.adjustsFontSizeToFitWidth = true
        questionMarkButton.titleLabel?.minimumScaleFactor = 0.8
        questionMarkButton.backgroundColor = UIColor.systemYellow
        questionMarkButton.layer.cornerRadius = questionMarkButton.bounds.width / 2
        
        
        self.view.addSubview(tumeronView)
        tumeronView.translatesAutoresizingMaskIntoConstraints = false
        tumeronView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tumeronView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        tumeronView.heightAnchor.constraint(equalToConstant: screenWidth / 1.2).isActive = true
        tumeronView.widthAnchor.constraint(equalToConstant: screenWidth / 1.3).isActive = true
        tumeronView.isHidden = true
        tumeronView.backgroundColor = UIColor(red: 247/255, green: 255/255, blue: 239/255, alpha: 1.0)
        tumeronView.layer.borderWidth = 0.1
        tumeronView.layer.cornerRadius = 40
        tumeronView.layer.shadowOffset = CGSize(width: 0, height: 4)
        tumeronView.layer.shadowOpacity = 0.7
        tumeronView.layer.shadowRadius = 10
        
        
        tumeronView.addSubview(tumeronLabel)
        tumeronLabel.translatesAutoresizingMaskIntoConstraints = false
        tumeronLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tumeronLabel.topAnchor.constraint(equalTo: tumeronView.topAnchor, constant: self.view.bounds.width / 13).isActive = true
        tumeronLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        tumeronLabel.textColor = UIColor.black
        tumeronLabel.text = "詰めロン"
        tumeronLabel.textAlignment = NSTextAlignment.center
        tumeronLabel.font = UIFont.systemFont(ofSize: 35)
        tumeronLabel.adjustsFontSizeToFitWidth = true
        
        
        tumeronView.addSubview(tumeronLv1Button)
        tumeronLv1Button.translatesAutoresizingMaskIntoConstraints = false
        tumeronLv1Button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tumeronLv1Button.topAnchor.constraint(equalTo: tumeronLabel.bottomAnchor, constant: self.view.bounds.width / 17 ).isActive = true
        tumeronLv1Button.heightAnchor.constraint(equalToConstant: screenWidth / 10).isActive = true
        tumeronLv1Button.widthAnchor.constraint(equalTo: tumeronLv1Button.heightAnchor, multiplier: 3).isActive = true
        tumeronLv1Button.tag = 4
        tumeronLv1Button.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        tumeronLv1Button.setTitle("レベル１", for: .normal)
        tumeronLv1Button.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        tumeronLv1Button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        tumeronLv1Button.titleLabel?.adjustsFontSizeToFitWidth = true
        tumeronLv1Button.titleLabel?.minimumScaleFactor = 0.8
        tumeronLv1Button.backgroundColor = UIColor.orange
        tumeronLv1Button.layer.cornerRadius = 10
        
        
        tumeronView.addSubview(tumeronLv2Button)
        tumeronLv2Button.translatesAutoresizingMaskIntoConstraints = false
        tumeronLv2Button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tumeronLv2Button.topAnchor.constraint(equalTo: tumeronLv1Button.bottomAnchor, constant: self.view.bounds.width / 24 ).isActive = true
        tumeronLv2Button.heightAnchor.constraint(equalToConstant: screenWidth / 10).isActive = true
        tumeronLv2Button.widthAnchor.constraint(equalTo: tumeronLv2Button.heightAnchor, multiplier: 3).isActive = true
        tumeronLv2Button.tag = 5
        tumeronLv2Button.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        tumeronLv2Button.setTitle("レベル２", for: .normal)
        tumeronLv2Button.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        tumeronLv2Button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        tumeronLv2Button.titleLabel?.adjustsFontSizeToFitWidth = true
        tumeronLv2Button.titleLabel?.minimumScaleFactor = 0.8
        tumeronLv2Button.backgroundColor = UIColor.orange
        tumeronLv2Button.layer.cornerRadius = 10
        
        
        tumeronView.addSubview(tumeronLv3Button)
        tumeronLv3Button.translatesAutoresizingMaskIntoConstraints = false
        tumeronLv3Button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tumeronLv3Button.topAnchor.constraint(equalTo: tumeronLv2Button.bottomAnchor, constant: self.view.bounds.width / 24 ).isActive = true
        tumeronLv3Button.heightAnchor.constraint(equalToConstant: screenWidth / 10).isActive = true
        tumeronLv3Button.widthAnchor.constraint(equalTo: tumeronLv3Button.heightAnchor, multiplier: 3).isActive = true
        tumeronLv3Button.tag = 6
        tumeronLv3Button.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        tumeronLv3Button.setTitle("レベル３", for: .normal)
        tumeronLv3Button.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        tumeronLv3Button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        tumeronLv3Button.titleLabel?.adjustsFontSizeToFitWidth = true
        tumeronLv3Button.titleLabel?.minimumScaleFactor = 0.8
        tumeronLv3Button.backgroundColor = UIColor.orange
        tumeronLv3Button.layer.cornerRadius = 10
        
        
        tumeronView.addSubview(closeTumeronViewButton)
        closeTumeronViewButton.translatesAutoresizingMaskIntoConstraints = false
        closeTumeronViewButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        closeTumeronViewButton.bottomAnchor.constraint(equalTo: tumeronView.bottomAnchor, constant: -screenWidth/20 ).isActive = true
        closeTumeronViewButton.heightAnchor.constraint(equalToConstant: screenWidth / 10).isActive = true
        closeTumeronViewButton.widthAnchor.constraint(equalTo: closeTumeronViewButton.heightAnchor, multiplier: 3).isActive = true
        closeTumeronViewButton.tag = 7
        closeTumeronViewButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        closeTumeronViewButton.setTitle("閉じる", for: .normal)
        closeTumeronViewButton.setTitleColor(UIColor.brown, for: .normal)
        closeTumeronViewButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        closeTumeronViewButton.titleLabel?.adjustsFontSizeToFitWidth = true
        closeTumeronViewButton.titleLabel?.minimumScaleFactor = 0.8
        closeTumeronViewButton.backgroundColor = UIColor.systemYellow
        closeTumeronViewButton.layer.cornerRadius = 10
        
        
        self.view.addSubview(battleView)
        battleView.translatesAutoresizingMaskIntoConstraints = false
        battleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        battleView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        battleView.heightAnchor.constraint(equalToConstant: screenWidth / 1.2).isActive = true
        battleView.widthAnchor.constraint(equalToConstant: screenWidth / 1.3).isActive = true
        battleView.isHidden = true
        battleView.backgroundColor = UIColor(red: 247/255, green: 255/255, blue: 239/255, alpha: 1.0)
        battleView.layer.borderWidth = 0.1
        battleView.layer.cornerRadius = 40
        battleView.layer.borderColor = UIColor.gray.cgColor
        battleView.layer.shadowOffset = CGSize(width: 0, height: 4)
        battleView.layer.shadowOpacity = 0.7
        battleView.layer.shadowRadius = 10
        
        
        battleView.addSubview(battleLabel)
        battleLabel.translatesAutoresizingMaskIntoConstraints = false
        battleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        battleLabel.topAnchor.constraint(equalTo: battleView.topAnchor, constant: self.view.bounds.width / 13).isActive = true
        battleLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        battleLabel.textColor = UIColor.black
        battleLabel.text = "対人対戦"
        battleLabel.textAlignment = NSTextAlignment.center
        battleLabel.font = UIFont.systemFont(ofSize: 35)
        battleLabel.adjustsFontSizeToFitWidth = true
        
        
        battleView.addSubview(battleVer1Button)
        battleVer1Button.translatesAutoresizingMaskIntoConstraints = false
        battleVer1Button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        battleVer1Button.topAnchor.constraint(equalTo: battleLabel.bottomAnchor, constant: self.view.bounds.width / 15 ).isActive = true
        battleVer1Button.heightAnchor.constraint(equalToConstant: screenWidth / 10).isActive = true
        battleVer1Button.widthAnchor.constraint(equalTo: battleVer1Button.heightAnchor, multiplier: 3).isActive = true
        battleVer1Button.tag = 8
        battleVer1Button.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        battleVer1Button.setTitle("Ver1", for: .normal)
        battleVer1Button.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        battleVer1Button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        battleVer1Button.titleLabel?.adjustsFontSizeToFitWidth = true
        battleVer1Button.titleLabel?.minimumScaleFactor = 0.8
        battleVer1Button.backgroundColor = UIColor.orange
        battleVer1Button.layer.cornerRadius = 10
        
        
        battleView.addSubview(battleVer2Button)
        battleVer2Button.translatesAutoresizingMaskIntoConstraints = false
        battleVer2Button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        battleVer2Button.topAnchor.constraint(equalTo: battleVer1Button.bottomAnchor, constant: self.view.bounds.width / 20 ).isActive = true
        battleVer2Button.heightAnchor.constraint(equalToConstant: screenWidth / 10).isActive = true
        battleVer2Button.widthAnchor.constraint(equalTo: battleVer2Button.heightAnchor, multiplier: 3).isActive = true
        battleVer2Button.tag = 9
        battleVer2Button.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        battleVer2Button.setTitle("Ver２", for: .normal)
        battleVer2Button.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        battleVer2Button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        battleVer2Button.titleLabel?.adjustsFontSizeToFitWidth = true
        battleVer2Button.titleLabel?.minimumScaleFactor = 0.8
        battleVer2Button.backgroundColor = UIColor.orange
        battleVer2Button.layer.cornerRadius = 10
        
        
        battleView.addSubview(closeBattleViewButton)
        closeBattleViewButton.translatesAutoresizingMaskIntoConstraints = false
        closeBattleViewButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        closeBattleViewButton.bottomAnchor.constraint(equalTo: battleView.bottomAnchor, constant: -screenWidth/20 ).isActive = true
        closeBattleViewButton.heightAnchor.constraint(equalToConstant: screenWidth / 10).isActive = true
        closeBattleViewButton.widthAnchor.constraint(equalTo: closeBattleViewButton.heightAnchor, multiplier: 3).isActive = true
        closeBattleViewButton.tag = 10
        closeBattleViewButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        closeBattleViewButton.setTitle("閉じる", for: .normal)
        closeBattleViewButton.setTitleColor(UIColor.brown, for: .normal)
        closeBattleViewButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        closeBattleViewButton.titleLabel?.adjustsFontSizeToFitWidth = true
        closeBattleViewButton.titleLabel?.minimumScaleFactor = 0.8
        closeBattleViewButton.backgroundColor = UIColor.systemYellow
        closeBattleViewButton.layer.cornerRadius = 10
    }
    
    
    
    @objc func buttonTapped(_ sender : Any) {
        
        switch (sender as AnyObject).tag{
        case 0://詰めロン
            questionMarkButton.isEnabled = false
            battleSelectButton.isEnabled = false
            timeAttackSelectButton.isEnabled = false
            tumeronView.isHidden = false
            closeTumeronViewButton.isHidden = false
        case 1://対人対戦
            battleView.isHidden = false
            battleSelectButton.isEnabled = false
            timeAttackSelectButton.isEnabled = false
            questionMarkButton.isEnabled = false
        case 2://タイムアタック
            appDelegate.audioPlayer.stop()
            appDelegate.audioPlayer.currentTime = 0
            performSegue(withIdentifier: "SegueToTimeAttack", sender: nil)
        case 3://？マーク
            appDelegate.audioPlayer.stop()
            appDelegate.audioPlayer.currentTime = 0
            performSegue(withIdentifier: "SegueToPopOver", sender: nil)
        case 4://レベル１
            buttonEnabled()
            heart = 1
            buttonAction()
        case 5://レベル２
            buttonEnabled()
            heart = 2
            buttonAction()
        case 6://レベル３
            buttonEnabled()
            heart = 3
            buttonAction()
        case 7://詰めロン選択画面閉じる
            tumeronView.isHidden = true
            questionMarkButton.isEnabled = true
            battleSelectButton.isEnabled = true
            timeAttackSelectButton.isEnabled = true
        case 8://対人対戦Ver1
            appDelegate.audioPlayer.stop()
            appDelegate.audioPlayer.currentTime = 0
            performSegue(withIdentifier: "SegueToBattleVer1", sender: nil)
            battleView.isHidden = true
            buttonEnabled()
        case 9://対人対戦Ver2
            appDelegate.audioPlayer.stop()
            appDelegate.audioPlayer.currentTime = 0
            performSegue(withIdentifier: "SegueToBattleVer2", sender: nil)
            battleView.isHidden = true
            buttonEnabled()
        case 10://対人対戦閉じる
            buttonEnabled()
            battleView.isHidden = true
        default:
            appDelegate.audioPlayer.stop()
            appDelegate.audioPlayer.currentTime = 0
            performSegue(withIdentifier: "segueToHistoryViewFromVC", sender: nil)
        }
        
    }
    
    deinit {        // 画面が破棄された時に監視をやめる
        if let observers = observers {
            NotificationCenter.default.removeObserver(observers)
        }
    }
    
    
    func buttonAction(){
        appDelegate.audioPlayer.stop()
        appDelegate.audioPlayer.currentTime = 0
        performSegue(withIdentifier: "SegueToTumeron", sender: nil)
        tumeronView.isHidden = true
    }
   
    
    func buttonEnabled(){
        questionMarkButton.isEnabled = true
        battleSelectButton.isEnabled = true
        timeAttackSelectButton.isEnabled = true
    }
    
    
}
