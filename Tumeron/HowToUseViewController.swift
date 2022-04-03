//
//  HowToUseViewController.swift
//  Tumeron
//
//  Created by 須藤裕功 on 2022/01/21.
//

import UIKit

class HowToUseViewController: UIViewController {
    
    var outView: UIView = UIView()
    var scrollView: UIScrollView = UIScrollView()
    var contentsView: UIView = UIView()
    
    let imageBox = ["t-htu1","t-htu2","t-htu3"]
    var returnedResizedImage: [UIImage] = [UIImage]()
    
    var howToUseIV1: UIImageView = UIImageView()
    var howToUseIV2: UIImageView = UIImageView()
    var howToUseIV3: UIImageView = UIImageView()
    var howToUseIV4: UIImageView = UIImageView()
    
    var hTPLabel1: UILabel = UILabel()
    var hTPLabel2: UILabel = UILabel()
    var hTPLabel3: UILabel = UILabel()
    var hTPLabel4: UILabel = UILabel()
    var hTPLabel5: UILabel = UILabel()
    var hTPLabel6: UILabel = UILabel()
    var hTPLabel7: UILabel = UILabel()
    var hTPLabel8: UILabel = UILabel()
    var hTPLabel9: UILabel = UILabel()
    var hTPLabel10: UILabel = UILabel()
    
    var backToMenuButton: UIButton = UIButton()
    
    var num: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
        
        
        changeSizeOfImage()
        
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        /*
        let screenWidth: CGFloat = view.frame.width
        let screenHeight: CGFloat = view.frame.height
        */
        
        outView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
        self.view.addSubview(outView)
        outView.translatesAutoresizingMaskIntoConstraints = false
        outView.topAnchor.constraint(equalTo: self.view.topAnchor, constant:self.view.safeAreaInsets.top).isActive = true
        outView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.view.safeAreaInsets.bottom).isActive = true
        outView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        outView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        
        scrollView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
        outView.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: outView.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: outView.bottomAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: outView.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: outView.trailingAnchor, constant: 0).isActive = true
        
        
        contentsView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
        scrollView.addSubview(contentsView)
        contentsView.translatesAutoresizingMaskIntoConstraints = false
        contentsView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        contentsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        contentsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        contentsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        contentsView.widthAnchor.constraint(equalTo: outView.widthAnchor).isActive = true
        contentsView.heightAnchor.constraint(equalToConstant: 3600).isActive = true
        
         
        scrollView.flashScrollIndicators()
        
        
        backToMenuButton.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 56/255, alpha: 1.0)
        backToMenuButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0), for: .normal)
        backToMenuButton.setTitle("戻る", for: .normal)
        backToMenuButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        backToMenuButton.titleLabel?.adjustsFontSizeToFitWidth = true
        backToMenuButton.layer.cornerRadius = 15
        contentsView.addSubview(backToMenuButton)
        backToMenuButton.translatesAutoresizingMaskIntoConstraints = false
        backToMenuButton.centerXAnchor.constraint(equalTo: contentsView.centerXAnchor).isActive = true
        backToMenuButton.bottomAnchor.constraint(equalTo: contentsView.bottomAnchor, constant: 0).isActive = true
        backToMenuButton.widthAnchor.constraint(equalToConstant: self.view.frame.width / 4).isActive = true
        backToMenuButton.heightAnchor.constraint(equalToConstant: self.view.frame.height / 17).isActive = true
        backToMenuButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        
        hTPLabel1.text = "詰めロンは4つの数字を当てるゲームです"
        hTPLabel1.numberOfLines = 0
        hTPLabel1.font = hTPLabel1.font.withSize(22)
        hTPLabel1.tintColor = UIColor.black
        contentsView.addSubview(hTPLabel1)
        hTPLabel1.translatesAutoresizingMaskIntoConstraints = false
        hTPLabel1.centerXAnchor.constraint(equalTo: contentsView.centerXAnchor).isActive = true
        hTPLabel1.topAnchor.constraint(equalTo: contentsView.topAnchor, constant: 20).isActive = true
        hTPLabel1.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 10).isActive = true
        hTPLabel1.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -0).isActive = true
        
        
        hTPLabel2.text = "◯　ゲーム画面について"
        hTPLabel2.font = hTPLabel2.font.withSize(26)
//        hTPLabel2.adjustsFontSizeToFitWidth = true
//        hTPLabel2.minimumScaleFactor = 0.5
        hTPLabel2.tintColor = UIColor.black
        contentsView.addSubview(hTPLabel2)
        hTPLabel2.translatesAutoresizingMaskIntoConstraints = false
        hTPLabel2.centerXAnchor.constraint(equalTo: contentsView.centerXAnchor).isActive = true
        hTPLabel2.topAnchor.constraint(equalTo: hTPLabel1.bottomAnchor, constant: 20).isActive = true
        hTPLabel2.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 10).isActive = true
        hTPLabel2.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -0).isActive = true
        
        
        howToUseIV1.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
        howToUseIV1.image = self.returnedResizedImage[0]
        howToUseIV1.contentMode = .scaleToFill
        contentsView.addSubview(howToUseIV1)
        howToUseIV1.translatesAutoresizingMaskIntoConstraints = false
        howToUseIV1.centerXAnchor.constraint(equalTo: contentsView.centerXAnchor).isActive = true
        howToUseIV1.topAnchor.constraint(equalTo: hTPLabel2.bottomAnchor, constant: 0).isActive = true
        howToUseIV1.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 10).isActive = true
        howToUseIV1.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -10).isActive = true
        
        
        hTPLabel3.text = "①　ヒントエリア\n詰めロンモードではヒントが表示されます。\nタイムアタックモードでは入力した数字とヒントが表示されます。\n\n②　イラストエリア\n詰めロンとタイムアタックモードではイラストが表示されます。入力した数字が答えに近づくにつれてイラストが変わります。\n\n③　入力エリア\nここで数字を入力します。×マークで打ち込んだ数字を消すことができます。OKマークを押せば入力が完了します。"
        hTPLabel3.numberOfLines = 0
        hTPLabel3.font = hTPLabel3.font.withSize(19)
        hTPLabel3.tintColor = UIColor.black
        contentsView.addSubview(hTPLabel3)
        hTPLabel3.translatesAutoresizingMaskIntoConstraints = false
        hTPLabel3.centerXAnchor.constraint(equalTo: contentsView.centerXAnchor).isActive = true
        hTPLabel3.topAnchor.constraint(equalTo: howToUseIV1.bottomAnchor, constant: 20).isActive = true
        hTPLabel3.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 10).isActive = true
        hTPLabel3.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -10).isActive = true
        
        
        hTPLabel4.text = "このゲームには３つのモードがあります。"
        hTPLabel4.font = hTPLabel4.font.withSize(25)
        hTPLabel4.numberOfLines = 0
        hTPLabel4.tintColor = UIColor.black
        contentsView.addSubview(hTPLabel4)
        hTPLabel4.translatesAutoresizingMaskIntoConstraints = false
        hTPLabel4.centerXAnchor.constraint(equalTo: contentsView.centerXAnchor).isActive = true
        hTPLabel4.topAnchor.constraint(equalTo: hTPLabel3.bottomAnchor, constant: 40).isActive = true
        hTPLabel4.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 10).isActive = true
        hTPLabel4.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -10).isActive = true
        
        
        hTPLabel5.text = "1　詰めロン"
        hTPLabel5.font = hTPLabel5.font.withSize(26)
//        hTPLabel4.adjustsFontSizeToFitWidth = true
//        hTPLabel4.minimumScaleFactor = 0.5
        hTPLabel5.tintColor = UIColor.black
        contentsView.addSubview(hTPLabel5)
        hTPLabel5.translatesAutoresizingMaskIntoConstraints = false
        hTPLabel5.centerXAnchor.constraint(equalTo: contentsView.centerXAnchor).isActive = true
        hTPLabel5.topAnchor.constraint(equalTo: hTPLabel4.bottomAnchor, constant: 30).isActive = true
        hTPLabel5.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 10).isActive = true
        hTPLabel5.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -10).isActive = true
        
        
        howToUseIV2.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
        howToUseIV2.image = self.returnedResizedImage[1]
        howToUseIV2.contentMode = .scaleToFill
        self.contentsView.addSubview(howToUseIV2)
        howToUseIV2.translatesAutoresizingMaskIntoConstraints = false
        howToUseIV2.centerXAnchor.constraint(equalTo: contentsView.centerXAnchor).isActive = true
        howToUseIV2.topAnchor.constraint(equalTo: hTPLabel5.bottomAnchor, constant: 0).isActive = true
        howToUseIV2.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 10).isActive = true
        howToUseIV2.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -10).isActive = true
        
        
        hTPLabel6.text = "上の画面は詰めロンのプレイ画面です。左がヒントエリア、右がイラストエリアになっています。\n\n　まず、初めに右上の数字は、あと何回チャレンジできるかの回数を表しています。これが0になると負けです。\n\n　次に、ヒントの見方を説明します。そもそも、詰めロンはランダムで設定された4桁の数字をできるだけ少ないヒントで探り出すゲームです。\n\n　ヒントの見方は以下の通りです。\n　=の右側に、答えとの比較した結果が出ています。例えば、今回、答えは『6870』です。仮に1回目、『1765』(1ヒント)と打ち込むとします。答えと比較すると、7と6が共通して使われています。しかしそれぞれ位置が違います。この場合、Bの左側にその個数が表示されます。今回の場合は2個あるので『2B』です。\n※ちなみに、同じ数字が別の位置にあることはありません！\n\n　次に『2857』(2ヒント)と答えるとしましょう。答えと比べると、8と7が共通して使われていて、かつ8は使われている場所も同じです。Hの左側には、8のような数字の数が表示されます。この場合、1個なので『1H』です。\n\n　詰めロンでは、チャレンジする度に『H』と『B』を用いてヒントが増えていきます。そのヒントをできるだけ少なく抑えて、答えを導いていきましょう！"
        
        hTPLabel6.numberOfLines = 0
        hTPLabel6.font = hTPLabel6.font.withSize(19)
        hTPLabel6.tintColor = UIColor.black
        contentsView.addSubview(hTPLabel6)
        hTPLabel6.translatesAutoresizingMaskIntoConstraints = false
        hTPLabel6.centerXAnchor.constraint(equalTo: contentsView.centerXAnchor).isActive = true
        hTPLabel6.topAnchor.constraint(equalTo: howToUseIV2.bottomAnchor, constant: 20).isActive = true
        hTPLabel6.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 10).isActive = true
        hTPLabel6.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -10).isActive = true
        
        
        hTPLabel7.text = "2　対人対戦"
        hTPLabel7.font = hTPLabel7.font.withSize(26)
//        hTPLabel4.adjustsFontSizeToFitWidth = true
//        hTPLabel4.minimumScaleFactor = 0.5
        hTPLabel7.tintColor = UIColor.black
        contentsView.addSubview(hTPLabel7)
        hTPLabel7.translatesAutoresizingMaskIntoConstraints = false
        hTPLabel7.centerXAnchor.constraint(equalTo: contentsView.centerXAnchor).isActive = true
        hTPLabel7.topAnchor.constraint(equalTo: hTPLabel6.bottomAnchor, constant: 30).isActive = true
        hTPLabel7.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 10).isActive = true
        hTPLabel7.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -10).isActive = true
        
        
        howToUseIV3.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
        howToUseIV3.image = self.returnedResizedImage[2]
        howToUseIV3.contentMode = .scaleToFill
        self.contentsView.addSubview(howToUseIV3)
        howToUseIV3.translatesAutoresizingMaskIntoConstraints = false
        howToUseIV3.centerXAnchor.constraint(equalTo: contentsView.centerXAnchor).isActive = true
        howToUseIV3.topAnchor.constraint(equalTo: hTPLabel7.bottomAnchor, constant: 0).isActive = true
        howToUseIV3.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 10).isActive = true
        howToUseIV3.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -10).isActive = true
        
        
        hTPLabel8.text = "上の画面は対人対戦の画面です。\nオンライン対戦には対応していません。\n\n対人対戦は2人で遊ぶモードです。\nVer1とVer2があります。\n\n　Ver1は答えの数字を相手より先に当てるゲームです。画面の左側は1P、右側は2Pが入力した数字が表示されます。入力した数字はお互いが見ることができます。\n　Ver2はお互いが最初に入力した数字を当てるゲームです。1Pは2Pが入力した数字、2Pは1Pが入力した数字を当てます。"
        hTPLabel8.numberOfLines = 0
        hTPLabel8.font = hTPLabel8.font.withSize(19)
        hTPLabel8.tintColor = UIColor.black
        contentsView.addSubview(hTPLabel8)
        hTPLabel8.translatesAutoresizingMaskIntoConstraints = false
        hTPLabel8.centerXAnchor.constraint(equalTo: contentsView.centerXAnchor).isActive = true
        hTPLabel8.topAnchor.constraint(equalTo: howToUseIV3.bottomAnchor, constant: 20).isActive = true
        hTPLabel8.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 10).isActive = true
        hTPLabel8.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -10).isActive = true
        
        
        hTPLabel9.text = "3　タイムアタック"
        hTPLabel9.font = hTPLabel9.font.withSize(26)
//        hTPLabel4.adjustsFontSizeToFitWidth = true
//        hTPLabel4.minimumScaleFactor = 0.5
        hTPLabel9.tintColor = UIColor.black
        contentsView.addSubview(hTPLabel9)
        hTPLabel9.translatesAutoresizingMaskIntoConstraints = false
        hTPLabel9.centerXAnchor.constraint(equalTo: contentsView.centerXAnchor).isActive = true
        hTPLabel9.topAnchor.constraint(equalTo: hTPLabel8.bottomAnchor, constant: 30).isActive = true
        hTPLabel9.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 10).isActive = true
        hTPLabel9.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -10).isActive = true
        
        
        hTPLabel10.text = "ひたすら数字を入力して答えを当てましょう！タイムアタックでは答えの数字を当てるまで、何回でも数字を入力することができます。"
        hTPLabel10.numberOfLines = 0
        hTPLabel10.font = hTPLabel9.font.withSize(19)
        hTPLabel10.tintColor = UIColor.black
        contentsView.addSubview(hTPLabel10)
        hTPLabel10.translatesAutoresizingMaskIntoConstraints = false
        hTPLabel10.centerXAnchor.constraint(equalTo: contentsView.centerXAnchor).isActive = true
        hTPLabel10.topAnchor.constraint(equalTo: hTPLabel9.bottomAnchor, constant: 30).isActive = true
        hTPLabel10.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 10).isActive = true
        hTPLabel10.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -10).isActive = true
    }
    
    @objc func buttonTapped(_ sender : Any) {
        if num == 0{
            dismiss(animated: true, completion: nil)
        }else if num == 1{
            performSegue(withIdentifier: "segueToVCFromHTUVC", sender: nil)
        }
    }
    
    
    func changeSizeOfImage(){
        var i = 0
        while i < imageBox.count{
            self.returnedResizedImage.append(resize(image: UIImage(named:"\(imageBox[i])")!))
            i += 1
        }
    }
    
    func resize(image: UIImage) -> UIImage {
        
        var aspectScale = image.size.height / image.size.width
        let imageWidth = self.view.bounds.size.width - 20
        
        let resizedSize = CGSize(width: imageWidth, height: imageWidth * Double(aspectScale))
        
        // リサイズ後のUIImageを生成して返却
        UIGraphicsBeginImageContext(resizedSize)
        image.draw(in: CGRect(x: 0, y: 0, width: resizedSize.width, height: resizedSize.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage!
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
