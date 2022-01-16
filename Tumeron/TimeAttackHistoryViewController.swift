//
//  TimeAttackHistoryViewController.swift
//  Tumeron
//
//  Created by 須藤裕功 on 2022/01/15.
//

import UIKit

class TimeAttackHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var timeAttackHistoryArray: [String] = [""]
    var viewNumber: Int = 0
    
    
    
    var backToMenuButton: UIButton = UIButton()
    var replayButton: UIButton = UIButton()
    var backButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth:CGFloat = self.view.frame.width
        //        let screenHeight:CGFloat = self.view.frame.height
        
        backToMenuButton = type(of: backToMenuButton).init(frame: CGRect(x:0, y:0, width: 0, height: 0 ))
        backToMenuButton.setImage(UIImage(named:"home"), for: .normal)
        backToMenuButton.layer.cornerRadius = 25
        self.view.addSubview(backToMenuButton)
        backToMenuButton.translatesAutoresizingMaskIntoConstraints = false
        backToMenuButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        backToMenuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        backToMenuButton.heightAnchor.constraint(equalToConstant: screenWidth / 6).isActive = true
        backToMenuButton.widthAnchor.constraint(equalToConstant: screenWidth / 6).isActive = true
        backToMenuButton.tag = 1
        backToMenuButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        if viewNumber == 1{
            replayButton = type(of: replayButton).init(frame: CGRect(x:0, y:0, width: 0, height: 0 ))
            replayButton.setImage(UIImage(named:"reload"), for: .normal)
            replayButton.layer.cornerRadius = 25
            self.view.addSubview(replayButton)
            replayButton.translatesAutoresizingMaskIntoConstraints = false
            replayButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
            replayButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
            replayButton.heightAnchor.constraint(equalToConstant: screenWidth / 6).isActive = true
            replayButton.widthAnchor.constraint(equalToConstant: screenWidth / 6).isActive = true
            replayButton.tag = 2
            replayButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
            
            backButton = type(of: backButton).init(frame: CGRect(x:0, y:0, width: 0, height: 0 ))
            backButton.setImage(UIImage(named:"yajirushi1"), for: .normal)
            backButton.layer.cornerRadius = 25
            self.view.addSubview(backButton)
            backButton.translatesAutoresizingMaskIntoConstraints = false
            backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
            backButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
            backButton.heightAnchor.constraint(equalToConstant: screenWidth / 6).isActive = true
            backButton.widthAnchor.constraint(equalToConstant: screenWidth / 6).isActive = true
            backButton.tag = 3
            backButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        }
        
    }
    
    @objc func buttonTapped(_ sender : Any) {
        guard let tapoVc = self.presentingViewController as? TimeAttackPopOverViewController else {return}
        if viewNumber == 0{//メニューからアクセス
            dismiss(animated: true, completion: nil)
        }else if viewNumber == 1{//タイムアタックの後にアクセス
            switch (sender as AnyObject).tag{
            case 1:
                tapoVc.dismiss(animated: false, completion: nil)
                tapoVc.backToMenuButton(UIButton())
            case 2:
                tapoVc.dismiss(animated: false, completion: nil)
                tapoVc.replayButton(UIButton())
            default:
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var timeAttackHistoryTable: UITableView!
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeAttackHistoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "timeAttackHistoryCell", for: indexPath)
        
        // セルに表示する値を設定する
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel!.text = timeAttackHistoryArray[indexPath.row]
        
        return cell
    }
}
