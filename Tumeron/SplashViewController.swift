//
//  SplashViewController.swift
//  Tumeron
//
//  Created by 須藤裕功 on 2022/01/10.
//

import UIKit

class SplashViewController: UIViewController {
    
    
    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        performSegue(withIdentifier: "segueToMainViewController", sender: nil)
    }
     */
    
    
    
    
    var logoImageView: UIImageView!
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToHTUfromSplashVC"{
            let HowToUseViewController = segue.destination as! HowToUseViewController
            HowToUseViewController.num = 1
        }
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
        
        //imageView作成
        self.logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 167, height: 167))
        //画面centerに
        self.logoImageView.center = self.view.center
        //logo設定
        self.logoImageView.image = UIImage(named: "tumeron_icon167.jpg")
        //viewに追加
        self.view.addSubview(self.logoImageView)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        //少し縮小するアニメーション
        UIView.animate(withDuration: 0.3,
                       delay: 1.0,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations: { () in
            self.logoImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: { (Bool) in
            
        })
       
        //拡大させて、消えるアニメーション
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations: { () in
            self.logoImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.logoImageView.alpha = 0
        }, completion: { (Bool) in
            self.logoImageView.removeFromSuperview()
            
        })
        
        segueToMVC()
        
    }
    
    func segueToMVC(){
        performSegue(withIdentifier: "segueToMainViewController", sender: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
