//
//  BattleVer1ResultViewController.swift
//  Tumeron
//
//  Created by 須藤　裕功 on 2021/04/30.
//

import UIKit
import AVFoundation

class BattleVer1ResultViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var audioPlayer4: AVAudioPlayer!
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var winnerImage: UIImageView!
    let image1Pwin = UIImage(named:"tumeron-1win")!
    let image2Pwin = UIImage(named:"tumeron-2win")!
    var judgeImage = 0
    
    @IBOutlet weak var trueNumLabel: UILabel!
    var trueNum: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if judgeImage == 1{
            winnerImage.image = image1Pwin
            winnerLabel.textColor = UIColor.red
            winnerLabel.text = "１Pの勝ち！"
        }else{
            winnerImage.image = image2Pwin
            winnerLabel.textColor = UIColor.blue
            winnerLabel.text = "２Pの勝ち！"
        }
        
        do {
            let filePath = Bundle.main.path(forResource: "clear",ofType: "mp3")
            let musicPath = URL(fileURLWithPath: filePath!)
            audioPlayer4 = try AVAudioPlayer(contentsOf: musicPath)
            audioPlayer4.play()
        } catch {
            print("error")
        }
        
        let inputNumStr = trueNum.map{ String($0) } //文字の配列に変換
        trueNumLabel.text = "正解は " + inputNumStr.joined(separator: "") + " でした！"
        
    }
    
    @IBAction func backToMenuButton(_ sender: Any) {
        audioPlayer4.stop()
        presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        appDelegate.audioPlayer.play()
    }
    
    @IBAction func replayButton(_ sender: Any) {
        audioPlayer4.stop()
        dismiss(animated: true, completion: nil)
        appDelegate.audioPlayerOfGame.play()
    }
    
}
