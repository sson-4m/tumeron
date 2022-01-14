//
//  TimeAttackPopOverViewController.swift
//  Tumeron
//
//  Created by 須藤　裕功 on 2021/04/20.
//

import UIKit
import AVFoundation

class TimeAttackPopOverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var audioPlayer4: AVAudioPlayer!
    
    @IBOutlet weak var clearTimeLabel: UILabel!
    var text1: String = ""
    @IBOutlet weak var numberOfTrialsLabel: UILabel!
    var text2: String = ""
    @IBOutlet weak var clearImageView: UIImageView!
    
    var resultArray: [String] = []
    
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
        clearImageView.image =  UIImage(named:"hit5.jpg")
        clearTimeLabel.text = "クリアタイム：　" + text1
        numberOfTrialsLabel.text = "　　試行回数：　"  + text2 + "回"
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
