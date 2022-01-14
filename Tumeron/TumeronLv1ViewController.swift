//
//  TumeronLv1ViewController.swift
//  Tumeron
//
//  Created by 須藤　裕功 on 2021/04/21.
//

import UIKit
import AVFoundation

class TumeronLv1ViewController: UIViewController{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var resetView: UIView!
    @IBOutlet weak var imageDependsOnHeart: UIImageView!
    let image2 = UIImage(named:"hit2.jpg")!
    let image3 = UIImage(named:"hit3.jpg")!
    let image4 = UIImage(named:"hit4.jpg")!
    @IBOutlet weak var heartCounterLabel: UILabel!
    var heartCounter: Int = 0
    @IBOutlet weak var inputNumberLabel: UILabel!
    var inputNumbersArray: [Int] = []  //入力した数字が格納される
    @IBOutlet weak var tableView: UITableView!
    var resultsUpdatedInTableView: [String] = [] //tableviewにのる比較結果
    
    var trueNumbersArray: [Int] = [] //答えの数字が格納される
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var inputButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var backToMenuButton: UIButton!
    
    var sum: Int = 0
    
    var counter1 = 1
    var counter2 = 1
    var counter3 = 1
    var counter4 = 1
    var counter5 = 1
    var counter6 = 1
    var counter7 = 1
    var counter8 = 1
    var counter9 = 1
    var counter0 = 1
    var tryCounter = 0
    
    var resetCount = 0
    
    let hints1 = [["2567=1H0B","4387=1H0B","2089=0H2B","1907=0H2B","4590=1H1B"],["2731=0H1B","0463=1H1B","1405=1H1B","0675=0H2B","5803=1H0B"],["6340=1H0B","5970=1H0B","1280=0H2B","5321=1H1B","2941=1H0B"],["0396=0H2B","9802=1H0B","6407=1H1B","5601=1H1B","7503=0H2B"],["5841=0H2B","9718=0H2B","1257=0H1B","8509=1H0B","4139=2H0B"],["6189=0H1B","7820=0H1B","3715=0H2B","4673=1H1B","4231=0H2B","2563=1H1B"],["1083=1H1B","4015=1H1B","3059=2H0B","2058=1H1B","8049=2H0B"],["1906=0H1B","4053=1H0B","2087=0H2B","8623=0H2B","4762=0H1B"],["6573=0H2B","8607=0H2B","3720=1H1B","2764=0H2B","5026=1H1B","7825=0H2B"],["6395=0H1B","4716=0H1B","8542=0H2B","1829=1H0B","3024=2H0B"],["5423=0H2B","2849=1H1B","2714=0H1B","6852=1H1B","4836=2H0B"],["9517=1H0B","0213=0H2B","8307=2H0B","4327=1H0B"],["5120=0H2B","9503=2H0B","1543=1H0B","7508=1H0B","6203=0H2B"],["4189=1H0B","7103=0H1B","6029=1H1B","4056=1H1B","3659=1H0B"],["7518=1H1B","1562=0H2B","9217=2H0B","9258=1H1B","8213=1H1B","9315=2H0B"],["5197=1H1B","5410=1H1B","5261=0H2B","2170=1H1B","1690=0H0B"],["3471=0H1B","4526=0H2B","1862=1H0B","5067=2H0B","5963=1H1B","9064=1H0B"],["8401=0H2B","7518=0H2B","4172=2H0B","4156=1H0B","3182=2H0B"],["0257=0H1B","6192=0H1B","3068=0H2B","9873=1H1B","4809=1H0B","5831=0H1B"],["2634=0H2B","1356=2H0B","8376=1H0B","1406=2H0B","1296=1H1B","9456=0H0B"],["2840=0H2B","0314=1H1B","8321=0H2B","4217=1H1B","6012=1H1B"],["3689=0H2B","1967=0H2B","9148=2H0B","9103=1H1B","7138=0H0B"],["6243=0H2B","1639=0H2B","9562=1H1B","0365=1H1B","2160=2H0B","5164=1H1B"],["8934=0H2B","9658=1H0B","4018=0H2B","9740=2H0B","9241=1H0B"],["1460=0H2B","2047=0H2B","5214=2H0B","6284=1H1B","5674=2H0B"],["4125=0H1B","9632=0H2B","7364=2H0B","7319=1H0B","7268=2H0B"],["7509=1H0B","4619=1H0B","3608=1H0B","4528=1H1B","3512=1H1B"],["0925=0H1B","9476=0H1B","7538=0H2B","8340=1H1B","3710=0H2B","4351=0H2B"],["5167=0H1B","0854=0H2B","7908=0H1B","9245=2H0B","8241=1H1B"],["0398=0H2B","9732=1H1B","9871=1H1B","5837=1H1B","9057=0H2B"],["3105=0H2B","0263=1H0B","5281=0H1B","7953=1H0B"],["1207=0H2B","7361=1H0B","7089=0H2B","8921=0H2B","2390=2H0B"],["0435=1H0B","1825=1H0B","0629=0H2B","7965=1H1B"],["8926=0H2B","4860=1H0B","5893=0H1B","7169=1H1B","3261=1H0B"],["2397=0H2B","3260=0H1B","9821=0H2B","6789=0H1B","1953=2H0B"],["2349=0H2B","4762=0H1B","1453=1H0B","6093=0H2B","9250=1H1B"],["2680=0H2B","9106=2H0B","5126=2H0B","5406=2H0B","9426=0H0B"],["7429=0H2B","9187=0H2B","1594=1H0B","8290=0H2B","0874=0H2B"],["2063=0H1B","8952=1H0B","6974=0H2B","3457=2H0B","1456=1H0B"],["1023=0H2B","6182=0H2B","2438=1H1B","2356=1H1B","2541=0H2B","3416=1H1B"],["7841=1H1B","7013=0H2B","0145=1H1B","0857=1H1B","3547=0H2B"],["6470=0H2B","1346=1H1B","1794=1H1B","1069=0H2B","2716=1H1B"],["9745=0H1B","7620=1H0B","5830=0H1B","3921=1H0B"],["7935=1H0B","1984=0H2B","7140=0H1B","6815=0H2B","8436=2H0B"],["8674=1H0B","0615=1H1B","3014=2H0B","5214=0H1B"],["6583=1H1B","5487=0H2B","4532=2H0B","4561=2H0B","7562=2H0B"],["1087=0H2B","5791=0H1B","8673=1H0B","8540=1H1B","0143=0H2B","8214=0H2B"],["1024=2H0B","5028=2H0B","7023=1H1B","1728=2H0B","5724=0H0B"],["3160=1H0B","4568=0H1B","9142=0H1B","3287=1H1B","7250=2H0B"],["6178=1H1B","6384=1H1B","6547=1H1B","6410=1H1B","6805=2H0B"],["8154=1H0B","6904=1H1B","6197=0H1B","8602=0H1B","0734=0H2B"],["6714=0H2B","8462=1H1B","9861=0H2B","8143=0H0B"],["3584=0H1B","8017=0H2B","7460=1H0B","1230=1H1B","5190=1H1B","9820=0H1B"],["0865=1H1B","0748=1H1B","8735=1H1B","0534=2H0B"],["5879=0H1B","6524=2H0B","6920=2H0B","6328=1H0B","6914=0H1B"],["3054=1H0B","1759=0H2B","9274=0H1B","8017=2H0B"],["9487=0H1B","4203=1H1B","7053=1H1B","5823=0H2B","4356=1H1B"],["3269=1H0B","5248=1H1B","8201=1H0B","8749=1H0B"],["8754=1H1B","3524=0H2B","6459=1H0B","7153=1H0B","0258=0H2B"],["8743=1H1B","2718=0H2B","8579=1H0B","6273=0H1B","8164=2H0B","8130=1H1B"],["4139=1H1B","9168=0H2B","8937=0H2B","1579=1H1B","6749=0H2B"],["4289=2H0B","4739=1H0B","4086=2H0B","4185=1H1B","1089=0H0B"],["5680=1H1B","7840=0H1B","2589=0H2B","8621=2H0B","4625=1H0B"],["7923=0H2B","0692=0H1B","5139=1H0B","8730=1H1B","2834=1H1B"],["1782=0H1B","5916=0H2B","7653=1H1B","3451=0H2B","2593=1H1B","7549=1H1B"],["4193=1H1B","4769=2H0B","4730=1H1B","4089=0H0B"],["4765=1H1B","6185=1H1B","0695=1H1B","1075=0H1B","4196=1H1B","6798=0H2B"],["7681=1H0B","4051=0H1B","7423=1H1B","3620=0H2B","5283=1H0B"],["7983=1H1B","8213=1H1B","8901=0H1B","7268=2H0B"],["8053=0H2B","4839=0H1B","0768=1H0B","3165=0H2B","0514=2H0B","2518=1H1B"],["4015=1H0B","9073=1H0B","2675=0H1B","9812=2H0B"],["6952=0H2B","4586=0H2B","8325=1H1B","2475=0H1B","0628=0H2B"],["1628=0H1B","9083=0H1B","3756=0H1B","4279=0H2B","5402=2H0B","7401=2H0B"],["9471=0H2B","1342=0H2B","6734=0H1B","3190=1H0B","2187=2H0B"]]
    
    let hints2 = [["8760=0H1B","7419=0H1B","6295=1H0B","4238=0H2B"],["2654=1H1B","7514=1H1B","5934=1H1B","9164=0H1B"],["8612=0H2B","2809=1H1B","1204=0H1B","9871=0H2B"],["0953=0H2B","8304=0H1B","2075=0H1B","9581=0H2B"],["1847=0H1B","6908=1H1B","7605=0H2B","6583=0H1B"],["2194=1H1B","8954=1H1B","1874=0H2B","8139=1H1B"],["2340=0H2B","1264=1H1B","1453=0H1B","0271=0H1B","3962=1H1B"],["8936=1H0B","1026=2H0B","1035=2H0B"],["0219=0H2B","1832=0H2B","5180=2H0B","9187=1H0B"],["9175=1H0B","9403=1H0B","2673=0H2B","9286=0H2B"],["1287=0H2B","9752=1H0B","6012=0H1B","9831=1H1B"],["1503=0H1B","8124=0H2B","4072=1H1B","9712=1H1B","3942=1H1B"],["6094=0H2B","0326=1H1B","0651=2H0B","0931=1H1B"],["7641=2H0B","7849=1H1B"],["6942=0H2B","9154=1H1B","2453=1H1B","9437=1H1B"],["0475=0H2B","4793=0H2B","7142=1H0B","8549=0H2B"],["4739=0H2B","9325=1H1B","2348=0H1B","7926=0H1B","3075=0H2B"],["1935=0H2B","6597=1H0B","2390=1H0B"],["0591=0H2B","2705=0H2B","6017=1H1B","3157=0H2B","5612=1H1B"],["7486=0H1B","0561=1H1B","4503=0H2B","0752=0H1B","5941=1H0B"],["0356=1H0B","8154=1H1B","1759=2H0B"],["3498=1H1B","9427=0H2B","4590=0H2B","2048=1H0B","7958=0H2B"],["9260=0H1B","8479=0H2B","7142=1H0B","0843=1H0B"],["5703=1H1B","9107=0H2B","7943=0H2B","5319=0H2B"],["2941=1H1B","4973=1H0B","4081=0H1B","8952=1H1B"],["2978=0H2B","7349=1H0B","5382=0H1B","0629=2H0B"],["4837=0H1B","2301=0H2B","0149=2H0B","0246=1H1B"],["2174=0H2B","7263=0H2B","8725=0H1B","1932=2H0B","1602=1H1B"],["0854=1H1B","6184=0H2B","4872=1H1B","7801=0H1B","8652=2H0B","1452=1H1B"],["1583=0H1B","6475=0H1B","0894=0H1B","9126=0H2B"],["8106=0H2B","5461=1H1B","6371=0H2B","1487=1H1B"],["4890=0H1B","2071=0H2B","8237=0H2B","1785=2H0B"],["6792=0H2B","8256=0H1B","2019=0H1B","9643=0H2B","4327=0H2B"],["2615=0H1B","5930=0H2B","0763=0H1B","1394=0H2B"],["0726=0H2B","7180=0H2B","1273=0H1B","9057=1H1B"],["8763=0H1B","1934=0H1B","7209=0H2B","4527=2H0B","9526=1H0B"],["4386=0H2B","9453=0H1B","5768=0H1B","6042=1H1B"],["6590=1H0B","2893=0H2B","4582=1H0B"],["7295=0H2B","2109=0H2B","3982=1H1B","3721=0H1B","5918=1H1B"],["7304=0H2B","5720=0H1B","4976=1H0B","4153=1H1B"],["5362=0H1B","9703=1H1B","6807=0H2B","0745=1H1B","8043=1H1B"],["8794=1H1B","3074=2H0B","9054=1H1B"],["6748=0H2B","4613=0H2B","7154=1H1B","2456=0H2B"],["7241=0H2B","0152=0H1B","9416=0H1B","4735=0H2B","2367=2H0B"],["2478=1H0B","9508=0H1B","2013=0H1B","3679=1H1B","5176=0H2B"],["6804=0H1B","4139=1H1B","1035=1H1B","2631=0H1B"],["6503=0H1B","0721=0H2B","7816=1H0B","7245=0H1B"],["0986=0H1B","5407=2H0B","9427=1H0B","5817=1H1B"],["6275=0H2B","4826=0H1B","2917=1H0B","5437=1H1B","5963=0H2B"],["1672=0H1B","7853=0H1B","4195=0H2B","3469=1H1B","8249=1H0B"],["6298=0H2B","8643=0H1B","2761=1H1B","1789=1H1B","2087=0H2B"],["4603=0H2B","5934=1H0B","1736=1H0B"],["6319=1H0B","6874=0H2B","5749=1H0B"],["5180=1H1B","3590=2H0B","2890=2H0B","2570=1H0B"],["2478=0H2B","4851=0H2B","0547=1H0B","8523=1H0B"],["1765=0H2B","0581=0H2B","2857=1H1B","6458=1H1B"],["9248=0H1B","6509=1H1B","0574=0H2B","2105=0H2B"],["3184=0H1B","6230=1H1B","1960=0H2B","6793=1H0B"],["7250=1H0B","9856=0H1B","1263=1H1B","7461=0H1B"],["0158=0H2B","4813=0H1B","8725=0H1B","9530=0H2B"],["5483=0H1B","1256=0H1B","2974=0H2B","0392=0H2B","9731=0H1B"],["5769=1H1B","8751=1H1B","5621=0H1B","3786=0H2B"],["3890=0H2B","4703=0H2B","8317=0H1B","0482=1H0B","0635=1H1B"],["6703=0H1B","3841=0H2B","0412=1H0B","8475=1H0B","8392=1H1B"],["3015=0H2B","8731=0H1B","0392=0H2B","5809=1H1B"],["5124=0H2B","6291=0H2B","9432=0H1B","1509=0H2B"],["1852=0H1B","7190=0H1B","0635=1H0B","8647=1H1B"],["1784=0H1B","5298=0H2B","9135=0H1B","2946=1H0B","2507=2H0B"],["7029=0H2B","6402=1H1B","3490=0H2B","1906=1H1B"],["9825=0H2B","2418=1H1B","2974=0H2B","8496=0H2B"],["2967=0H2B","7436=1H0B","1286=0H1B","7091=2H0B"],["2390=0H1B","1872=0H2B","8507=0H2B","4285=0H2B","7948=2H0B"],["8620=0H1B","0179=0H1B","9463=1H1B","5293=1H1B"],["9872=0H1B","3956=0H1B","8415=1H1B","8604=0H1B"],["2754=1H0B","8364=2H0B"],["3895=0H1B","9460=0H1B","5071=0H2B","4187=1H0B"],["7132=0H2B","4725=0H1B","8291=0H2B","1079=1H1B","3978=0H2B"],["9253=0H2B","0912=2H0B","3914=1H1B","4962=1H0B"],["6895=1H0B","7834=2H0B"],["1634=0H2B","4518=1H1B","2813=2H0B","2417=1H0B"],["4301=0H2B","7840=2H0B","7610=2H0B","7230=1H1B"],["3214=0H1B","0952=1H0B","7682=0H2B","4856=1H1B"],["4960=1H0B","3810=0H2B","8362=1H0B"],["8429=0H1B","5931=0H2B","6590=0H1B","0314=1H0B"],["5967=1H0B","1920=1H0B","1368=1H1B","1847=1H1B"],["4073=0H1B","5316=0H2B","2154=1H1B","3258=0H2B","7185=0H1B"],["3894=0H2B","5639=0H2B","4361=0H2B","7913=1H1B","6783=1H1B"],["4806=0H1B","7621=0H2B","9012=0H2B","2789=1H1B","1794=0H1B"],["5192=1H0B","8174=0H2B","5837=1H1B","5048=0H2B"],["1347=1H1B","4368=0H1B","5617=0H2B","1879=0H1B"],["2135=0H2B","9571=1H1B","8921=1H0B","7524=0H1B"],["2193=0H1B","5637=0H1B","7801=0H2B","8025=1H1B","9068=1H0B"]]
    
    let hints3 = [["3821=1H1B","3247=0H2B","0523=0H1B","9371=1H1B"],["6854=0H1B","9735=0H2B","0983=0H2B"],["1078=1H0B","2638=0H1B"],["2904=0H1B","7085=2H0B"],["9875=0H2B","1596=1H1B","4529=1H1B"],["9034=0H1B","1362=0H1B","8971=1H1B"],["5492=0H1B","3960=0H2B","0126=0H2B","6237=1H1B"],["2071=1H1B","7035=0H1B","6274=2H0B"],["5087=0H2B","1754=0H2B","2975=0H1B","3548=2H0B"],["6857=0H1B","9035=0H1B","8912=0H1B"],["8023=1H0B","7924=1H1B"],["0197=0H1B","6439=0H1B","5762=0H2B","9528=2H0B"],["9874=0H2B","1738=0H2B","3967=1H1B"],["6392=0H1B","1043=0H2B","8614=0H1B","3751=0H2B"],["1523=0H1B","4057=1H1B","7091=0H2B","4902=1H0B"],["0295=0H2B","4927=0H1B","9581=2H0B"],["1036=1H0B","1728=2H0B"],["6134=0H1B","8047=1H0B","2967=0H1B"],["3867=1H1B","0761=0H1B","8527=2H0B"],["0864=0H1B","9756=2H0B"],["4732=0H1B","7186=0H1B","5391=2H0B"],["0758=0H1B","6382=1H0B","4397=0H2B"],["2360=0H1B","3587=1H1B","1937=0H1B"],["7613=0H2B","5961=1H0B","0764=1H1B"],["3981=2H0B","4781=1H0B"],["6309=0H1B","8210=2H0B","5216=1H1B"],["7168=0H2B","8975=1H1B","0872=1H1B"],["5279=0H2B","4715=0H1B","6924=1H0B"],["1358=1H0B","4302=2H0B"],["7091=1H0B","4296=0H2B","5621=0H2B"],["7934=0H2B","1476=0H1B","3702=0H1B","8597=2H0B"],["5927=1H0B","5103=0H1B"],["6421=1H1B","4027=0H1B"],["3185=0H2B","7536=0H1B","8329=1H0B"],["5412=0H2B","1236=1H0B"],["7061=1H1B","9201=1H1B"],["7415=1H1B","7201=0H2B"],["0839=0H1B","6782=0H2B","3526=0H1B"],["2763=0H2B","3475=0H1B","6039=0H2B","0642=1H0B"],["0639=0H1B","8153=0H1B","7562=1H1B","4597=0H2B"],["1043=0H1B","8712=0H1B","0975=0H2B","2650=1H0B"],["5094=0H1B","8536=0H1B","7913=0H2B"],["7129=0H1B","5347=0H2B","6531=1H1B","2035=0H1B"],["9371=0H1B","4809=2H0B","4207=1H0B"],["5796=2H0B","8096=1H1B"],["3950=0H1B","2701=2H0B"],["7281=1H0B","5234=1H1B"],["7463=1H1B","7156=1H1B","3169=0H2B","7698=1H1B"],["6982=0H1B","5241=0H1B","8734=1H1B","8057=1H0B"],["5732=1H1B","6837=1H1B","7430=1H1B"],["6385=0H2B","9837=1H0B"],["7286=0H2B","8601=0H1B","1527=1H0B"],["5698=1H1B","5907=0H2B","6490=0H2B","7654=0H2B"],["2013=1H0B","7693=1H0B"],["8721=0H2B","5387=0H1B","0152=0H1B"],["5987=0H1B","7136=0H1B","0564=0H2B","2649=1H0B"],["3247=0H2B","2306=0H1B","7531=0H1B"],["1792=0H2B","4019=2H0B"],["6019=0H2B","5860=1H1B","7965=1H0B"],["3712=0H1B","6081=0H1B","0924=1H1B","9154=1H1B"],["8516=0H1B","2431=0H2B","9348=2H0B"],["3618=0H2B","4236=0H1B","5380=0H2B"],["6705=0H1B","8519=1H1B","8497=0H1B","9612=2H0B"],["7206=0H2B","8960=0H1B","0547=0H2B"],["4137=0H2B","6419=0H2B","1563=0H2B"],["0653=0H1B","9175=1H1B","9867=0H2B"],["5480=0H2B","3064=0H2B","8743=2H0B"],["1847=0H1B","3264=1H0B"],["0379=0H2B","7894=1H1B","7436=1H1B"],["4971=1H0B","4863=1H1B"],["4250=0H1B","6483=0H1B","5317=1H1B","9815=1H1B"],["9746=1H1B","9650=0H2B","1549=1H1B"],["4287=1H0B","0517=1H0B","4916=0H1B"],["1405=0H2B","6047=1H0B","6519=1H1B"],["3608=0H2B","4186=0H1B","8720=1H1B"],["1869=1H1B","9467=0H2B","0639=0H2B"],["5467=0H2B","9651=1H1B","9345=1H0B","9786=0H2B"],["1278=1H1B","3216=0H1B","9428=1H0B"],["0936=0H2B","6371=0H2B","7569=0H1B","3720=2H0B"],["2657=0H2B","3746=1H0B","0715=1H1B"],["6740=0H1B","1526=0H1B","4891=0H2B","2483=0H1B"],["9642=1H0B","5072=1H1B"],["7362=1H0B","4592=0H1B"],["0568=0H2B","4896=0H2B","5641=1H1B","6740=0H1B"]]
    
    let answers1 = [[9,3,6,0],[5,4,2,6],[2,3,7,8],[9,6,5,7],[8,1,3,6],[8,4,5,3],[3,0,4,2],[9,2,5,8],[3,2,8,6],[5,0,2,7],[4,8,0,5],[9,3,0,6],[9,5,6,2],[4,6,2,7],[9,8,1,6],[2,4,5,7],[5,0,3,2],[3,1,7,0],[4,3,7,6],[1,3,0,2],[6,2,3,4],[9,0,4,6],[4,9,6,0],[3,6,4,0],[5,8,0,4],[5,3,6,8],[7,2,1,8],[8,1,9,3],[3,2,8,5],[7,8,0,2],[0,9,1,4],[2,8,6,0],[1,9,3,6],[4,2,7,9],[4,9,5,2],[9,4,0,8],[5,1,0,8],[1,7,0,2],[8,4,0,7],[5,3,1,8],[1,8,3,5],[4,2,9,6],[4,6,8,1],[8,2,3,1],[3,0,7,5],[7,5,3,1],[2,4,7,0],[1,0,3,8],[7,9,8,0],[6,7,0,3],[3,9,5,0],[7,6,9,2],[7,1,3,9],[0,6,3,7],[1,5,2,0],[3,6,1,7],[7,2,3,6],[3,5,4,1],[8,4,0,3],[8,0,2,4],[4,8,7,1],[4,2,5,6],[8,6,9,3],[6,4,3,7],[2,6,4,5],[1,7,6,3],[4,6,8,0],[7,2,0,9],[7,2,3,0],[0,3,1,2],[6,8,1,3],[5,3,6,0],[5,4,9,1],[4,1,8,5]]
    
    let answers2 = [[3,1,8,5],[2,5,3,1],[6,7,2,9],[6,1,9,0],[3,9,7,0],[4,1,5,3],[8,9,2,4],[1,9,2,5],[3,1,6,0],[6,1,0,2],[3,7,4,1],[0,8,9,2],[0,4,5,3],[9,6,4,2],[9,5,6,3],[7,9,5,6],[9,1,0,3],[6,3,4,1],[7,2,1,9],[3,9,6,0],[2,7,5,8],[3,0,7,9],[7,8,5,6],[4,7,5,1],[2,1,5,3],[7,6,2,1],[0,1,6,8],[6,9,4,2],[4,6,5,7],[7,0,1,2],[4,0,6,7],[1,7,4,3],[5,9,7,4],[3,4,5,8],[5,8,6,7],[0,5,1,7],[3,6,1,2],[6,1,3,2],[0,9,5,3],[3,1,7,8],[9,0,8,5],[3,0,9,8],[7,2,6,1],[2,3,8,4],[1,4,6,9],[7,1,4,5],[3,9,1,2],[5,4,3,8],[2,5,3,0],[3,0,4,1],[9,7,0,6],[5,0,8,6],[0,7,1,8],[3,8,6,0],[8,6,1,7],[6,8,7,0],[6,7,2,0],[6,5,0,8],[1,3,8,0],[6,0,8,9],[7,8,2,0],[8,5,3,9],[0,9,7,6],[9,3,1,5],[1,9,0,4],[3,6,1,5],[8,9,3,4],[2,8,0,3],[2,1,0,3],[4,5,1,9],[7,0,5,2],[0,1,4,8],[4,0,5,3],[7,5,1,0],[8,3,5,1],[2,6,5,7],[2,3,0,9],[7,3,1,2],[7,1,3,5],[5,0,1,3],[7,8,1,3],[4,9,6,7],[4,3,5,1],[7,2,1,5],[8,3,2,7],[2,9,3,1],[8,1,5,3],[5,2,6,9],[7,8,9,0],[2,1,4,5],[3,7,0,1],[1,0,5,4]]
    
    let answers3 = [[4,6,3,1],[3,5,0,2],[1,4,5,6],[7,6,2,5],[4,1,9,8],[5,8,4,1],[8,2,0,3],[8,2,7,9],[3,5,0,1],[1,7,0,4],[6,0,9,4],[3,5,7,8],[3,4,9,1],[7,8,3,0],[5,9,6,7],[2,5,8,6],[9,0,2,8],[5,0,1,9],[8,9,4,7],[9,3,5,8],[5,6,9,4],[9,5,4,2],[5,2,8,1],[0,3,4,1],[3,2,8,0],[8,9,1,5],[0,6,8,5],[8,9,5,3],[9,3,6,2],[7,8,6,2],[6,5,9,3],[6,3,4,7],[7,6,3,1],[1,0,5,9],[1,8,9,4],[1,2,6,3],[0,8,7,5],[2,1,4,8],[7,6,9,8],[1,7,6,4],[4,8,5,9],[4,1,7,8],[6,4,9,3],[4,5,6,9],[3,7,8,6],[2,7,6,9],[6,2,9,3],[7,9,1,4],[9,1,3,7],[6,7,5,0],[5,2,3,0],[6,9,2,3],[0,5,4,8],[2,6,5,4],[7,4,1,6],[2,0,1,5],[9,1,2,4],[2,0,5,9],[8,1,6,4],[0,4,5,3],[9,1,4,7],[7,1,0,3],[9,0,1,3],[6,7,1,4],[0,3,4,6],[7,1,2,6],[8,9,0,3],[5,2,7,0],[4,0,9,6],[4,2,5,6],[7,9,1,4],[4,5,2,6],[6,5,8,3],[5,0,2,9],[2,7,6,3],[6,8,4,0],[6,8,4,1],[1,4,5,7],[1,6,2,0],[8,5,1,6],[3,9,1,7],[8,0,4,7],[9,8,6,0],[9,6,5,2]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.audioPlayerOfGame.currentTime = 0
        appDelegate.audioPlayerOfGame.play()
        
        
        //view.addSubview(resetView)
        resetView.center = view.center
        resetView.isHidden = true
        resetView.backgroundColor = UIColor(red: 247/255, green: 255/255, blue: 239/255, alpha: 1.0)
        resetView.layer.borderWidth = 3.5
        resetView.layer.borderColor = UIColor.orange.cgColor
        resetView.layer.cornerRadius = 20
        
        heartCounterLabel.text = "❤️×" + String(heartCounter)
        resetCount = 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToGameTumeronResultView"{
            let GameTumeronResultViewController = segue.destination as! GameTumeronResultViewController
            if heartCounter == 0{
                GameTumeronResultViewController.counter = 1
            }else{
                GameTumeronResultViewController.counter = 2
            }
            let trueNumStr = trueNumbersArray.map{ String($0) } //文字の配列に変換
            let trueResult = trueNumStr.joined(separator: "") //文字列に変換
            GameTumeronResultViewController.textResult = trueResult
        }
    }
    
    @IBAction func startButton(_ sender: Any){
        if trueNumbersArray.count == 0{
            imageDependsOnHeart.isHidden = false
            counterEnabled()
            tryCounter = 0
            resetCount = 0
            resultsUpdatedInTableView.removeAll()
            if heartCounter == 3{
                imageDependsOnHeart.image = image4
                let answerNum = Int.random(in: 0..<answers3.count-1)
                resultsUpdatedInTableView = hints3[answerNum]
                trueNumbersArray = answers3[answerNum]
            }else if heartCounter == 2{
                imageDependsOnHeart.image = image3
                let answerNum = Int.random(in: 0..<answers2.count-1)
                resultsUpdatedInTableView = hints2[answerNum]
                trueNumbersArray = answers2[answerNum]
            }else{
                imageDependsOnHeart.image = image2
                let answerNum = Int.random(in: 0..<answers1.count-1)
                resultsUpdatedInTableView = hints1[answerNum]
                trueNumbersArray = answers1[answerNum]
            }
            tableView.reloadData()
            inputNumberLabel.text = "数字をタップして入力"
            print(trueNumbersArray)
        }
    }
    
    
    
    @IBAction func button1(_ sender: Any) {
        if counter1 == 0 {
            judgeNum(num: 1)
            
            counter1 += 1
            addButtonCounter()
            if sum <= 4{
                button1.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button2(_ sender: Any) {
        if counter2 == 0 {
            judgeNum(num: 2)
            
            counter2 += 1
            addButtonCounter()
            if sum <= 4{
                button2.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button3(_ sender: Any) {
        if counter3 == 0 {
            judgeNum(num: 3)
            
            counter3 += 1
            addButtonCounter()
            if sum <= 4{
                button3.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button4(_ sender: Any) {
        if counter4 == 0 {
            judgeNum(num: 4)
            
            counter4 += 1
            addButtonCounter()
            if sum <= 4{
                button4.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button5(_ sender: Any) {
        if counter5 == 0 {
            judgeNum(num: 5)
            
            counter5 += 1
            addButtonCounter()
            if sum <= 4{
                button5.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button6(_ sender: Any) {
        if counter6 == 0 {
            judgeNum(num: 6)
            
            counter6 += 1
            addButtonCounter()
            if sum <= 4{
                button6.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button7(_ sender: Any) {
        if counter7 == 0{
            judgeNum(num: 7)
            
            counter7 += 1
            addButtonCounter()
            if sum <= 4{
                button7.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button8(_ sender: Any) {
        if counter8 == 0{
            judgeNum(num: 8)
            
            counter8 += 1
            addButtonCounter()
            if sum <= 4{
                button8.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button9(_ sender: Any) {
        if counter9 == 0{
            judgeNum(num: 9)
            
            counter9 += 1
            addButtonCounter()
            if sum <= 4{
                button9.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    @IBAction func button0(_ sender: Any) {
        if counter0 == 0{
            judgeNum(num: 0)
            
            counter0 += 1
            addButtonCounter()
            if sum <= 4{
                button0.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
    
    func judgeNum(num: Int){
        
        if inputNumbersArray.count <= 3 && trueNumbersArray.count > 3{
            inputNumbersArray.append(num)
            inputNumLabel()
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        if inputNumbersArray.count > 0{
            inputNumbersArray.removeAll()
            inputNumberLabel.text = "数字をタップして入力"
            counterEnabled()
            buttonTitleColor()
            sum = 0
        }
    }
    
    @IBAction func inputButton(_ sender: Any) {
        if inputNumbersArray.count == 4{
            checkNumbers(inputNum: inputNumbersArray, trueNum: trueNumbersArray)
            buttonTitleColor()
            counterEnabled()
            sum = 0
            tryCounter += 1
        }
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        if resetCount == 0{
            reset()
            /*
            resetView.isHidden = false
            buttonIsNotEnabled()
             */
        }
    }
    @IBAction func doResetButton(_ sender: UIButton) {
        reset()
        resetView.isHidden = true
        buttonIsEnabled()
    }
    
    @IBAction func doNotResetButton(_ sender: UIButton) {
        resetView.isHidden = true
        buttonIsEnabled()
    }
    
    func buttonIsEnabled(){
        button1.isEnabled = true
        button2.isEnabled = true
        button3.isEnabled = true
        button4.isEnabled = true
        button5.isEnabled = true
        button6.isEnabled = true
        button7.isEnabled = true
        button8.isEnabled = true
        button9.isEnabled = true
        button0.isEnabled = true
        deleteButton.isEnabled = true
        inputButton.isEnabled = true
    }
    
    func buttonIsNotEnabled(){
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
        button5.isEnabled = false
        button6.isEnabled = false
        button7.isEnabled = false
        button8.isEnabled = false
        button9.isEnabled = false
        button0.isEnabled = false
        deleteButton.isEnabled = false
        inputButton.isEnabled = false
    }
    
    func reset(){
        imageDependsOnHeart.isHidden = true
        inputNumbersArray.removeAll()
        trueNumbersArray.removeAll()
        resultsUpdatedInTableView.removeAll()
        heartCounter += tryCounter
        tableView.reloadData()
        inputNumberLabel.text = "スタートを押して下さい"
        heartCounterLabel.text = "❤️×" + String(heartCounter)
        buttonTitleColor()
        counterUnEnabled()
        sum = 0
        resetCount += 1
    }
    
    @IBAction func backToMenuButton(_ sender: Any) {
        appDelegate.audioPlayerOfGame.stop()
        dismiss(animated: true, completion: nil)
        appDelegate.audioPlayer.play()
    }
    
    func inputNumLabel(){
        let inputNumStr = inputNumbersArray.map{ String($0) } //文字の配列に変換
        inputNumberLabel.text = inputNumStr.joined(separator: " ") //文字列に変換
    }
    
    func checkNumbers(inputNum: [Int], trueNum: [Int]){
        var h = 0
        var b = 0
        for i in 0..<4{
            for j in 0..<4{
                if trueNum[i] == inputNum[j]{
                    if j==i{
                        h += 1
                    }else{
                        b += 1
                    }
                }
            }
        }
        if h == 4{             //全部答えと一緒だったときの処理
            appDelegate.audioPlayerOfGame.stop()
            appDelegate.audioPlayerOfGame.currentTime = 0
            performSegue(withIdentifier: "SegueToGameTumeronResultView", sender: nil)
        }else { //答えと一致しない時
            heartCounter -= 1
            if heartCounter >= 1{
                counterEnabled()
                if heartCounter == 2{
                    imageDependsOnHeart.image = image3
                }else if heartCounter == 1{
                    imageDependsOnHeart.image = image2
                }
                inputNumberLabel.text = "数字をタップして入力"
                heartCounterLabel.text = "❤️×" + String(heartCounter)
                inputNumbersArray.removeAll()
            }else{
                appDelegate.audioPlayerOfGame.stop()
                appDelegate.audioPlayerOfGame.currentTime = 0
                performSegue(withIdentifier: "SegueToGameTumeronResultView", sender: nil)
            }
        }
    }
    
    func counterEnabled(){
        counter1 = 0
        counter2 = 0
        counter3 = 0
        counter4 = 0
        counter5 = 0
        counter6 = 0
        counter7 = 0
        counter8 = 0
        counter9 = 0
        counter0 = 0
    }
    
    func counterUnEnabled(){
        counter1 = 1
        counter2 = 1
        counter3 = 1
        counter4 = 1
        counter5 = 1
        counter6 = 1
        counter7 = 1
        counter8 = 1
        counter9 = 1
        counter0 = 1
    }
    
    func buttonTitleColor(){
        let originalColor = UIColor(red: 255/255, green: 255/255, blue: 186/255, alpha: 1.0)
        button1.setTitleColor(originalColor, for: .normal)
        button2.setTitleColor(originalColor, for: .normal)
        button3.setTitleColor(originalColor, for: .normal)
        button4.setTitleColor(originalColor, for: .normal)
        button5.setTitleColor(originalColor, for: .normal)
        button6.setTitleColor(originalColor, for: .normal)
        button7.setTitleColor(originalColor, for: .normal)
        button8.setTitleColor(originalColor, for: .normal)
        button9.setTitleColor(originalColor, for: .normal)
        button0.setTitleColor(originalColor, for: .normal)
    }
    
    func addButtonCounter(){
        sum = counter1 + counter2 + counter3 + counter4 + counter5 + counter6 + counter7 + counter8 + counter9 + counter0
    }
    
}

extension TumeronLv1ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsUpdatedInTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellLv1", for: indexPath)
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
        cell.textLabel!.text = resultsUpdatedInTableView[indexPath.row]
        return cell
    }
}
