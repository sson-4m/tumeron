//
//  GameTumeronResultViewController.swift
//  Tumeron
//
//  Created by 須藤　裕功 on 2021/04/23.
//

import UIKit
import AVFoundation

class GameTumeronResultViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var audioPlayer5: AVAudioPlayer!
    
    @IBOutlet weak var clearOrFail: UILabel!
    var counter: Int = 0
    @IBOutlet weak var resultLabel: UILabel!
    var textResult = ""
    @IBOutlet weak var resultViewImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = "正解は " + textResult + " でした！"
        
        if counter == 1{
            do {
                resultViewImage.image =  UIImage(named:"tumeron-fail")
                clearOrFail.text = "残念！"
                let filePath = Bundle.main.path(forResource: "fail",ofType: "mp3")
                let musicPath = URL(fileURLWithPath: filePath!)
                audioPlayer5 = try AVAudioPlayer(contentsOf: musicPath)
                audioPlayer5.play()
            } catch {
                
            }
        }else{
            do {
                resultViewImage.image = UIImage(named:"tumeron-clear")
                clearOrFail.text = "クリア！"
                let filePath = Bundle.main.path(forResource: "clear",ofType: "mp3")
                let musicPath = URL(fileURLWithPath: filePath!)
                audioPlayer5 = try AVAudioPlayer(contentsOf: musicPath)
                audioPlayer5.play()
            } catch {

            }
        }
        
    }
    @IBAction func backToMenuButton(_ sender: UIButton) {
        audioPlayer5.stop()
        presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        appDelegate.audioPlayer.play()
    }
}
