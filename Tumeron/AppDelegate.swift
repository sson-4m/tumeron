//
//  AppDelegate.swift
//  Tumeron
//
//  Created by 須藤　裕功 on 2021/04/18.
//

import UIKit
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var audioPlayer = AVAudioPlayer()
    var sound_data = NSURL(fileURLWithPath: Bundle.main.path(forResource: "hit-title", ofType: "mp3")!)
    
    var audioPlayerOfGame = AVAudioPlayer()
    var sound_dataOgGame = NSURL(fileURLWithPath: Bundle.main.path(forResource: "hit1", ofType: "mp3")!)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        audioPlayer =  try! AVAudioPlayer(contentsOf:sound_data as URL)
        audioPlayer.play()       //アプリ起動から音楽スタート
        audioPlayer.numberOfLoops = -1      //音楽ループ
        
        audioPlayerOfGame =  try! AVAudioPlayer(contentsOf:sound_dataOgGame as URL)

        audioPlayerOfGame.numberOfLoops = -1      //音楽ループ
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

