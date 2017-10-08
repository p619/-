//
//  QuestionViewController.swift
//  chem1
//
//  Created by heroshi on 2017/3/1.
//  Copyright © 2017年 heroshi. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionNoLabel: UILabel! //第幾題
    var ansArrayNo = 0  //第幾題的答案
    var QNAarrayNo = 0 //第幾個array
    
    @IBOutlet weak var gradelabel: UILabel!
    
    var quesNo:Int = 0 //還沒按的時候,表示題號
    @IBOutlet weak var ques: UILabel! //問題
    
    @IBOutlet weak var itemA: UIButton!
    @IBOutlet weak var itemB: UIButton!
    
    @IBOutlet weak var itemＣ: UIButton!
    
    @IBOutlet weak var itemＤ: UIButton!
    
    @IBOutlet weak var 開始作答: UIButton!
    

    
    
    @IBOutlet weak var quespic: UIImageView!
    
    struct QNA {
        var Ques = ""
        var Ans = ""
        var picture = UIImage(named:"1012")
        var ansPic = UIImage(named:"1012")
        var cal = ""
    }
    struct Ans {
        var Ans = ""
        var ansPic = UIImage(named:"1012")
        var cal = ""
    }
    
    var 速率 = 0
    var 濃度A = 0
    var 濃度B = 0
    var 濃度C = 0
    var 時間 = 0
    var 初始濃度 = 0
    var 壓力A = 0
    var 壓力B = 0
    var 壓力C = 0
    var A的莫耳數 = 0
    var B的莫耳數 = 0
    var 等莫耳之A和B = 1
    var A和B莫耳數比改為三比二 = 1.5
    var btnATitle = ""
    
    
    var randomNumber =  Int(arc4random_uniform(16))//定義隨機變數

    //下一題
   @IBAction func nextques(_ sender: Any) {
    
       let random = randomNumber
    var QnaArray = [
        QNA(Ques:"",Ans:"",picture: UIImage(named:""),ansPic : UIImage(named:""),cal : ""),
        QNA(Ques:"某氣相反應系 ，PA、PB表A、B氣體之分壓。已知25°C之下，1atm且等莫耳之A和B混合作用之反應速率為S，若溫度壓力不變，但A莫耳數改為3,B莫耳數改為\(randomNumber)時，反應速率為aS，則a值為若干？【85北聯】",Ans:"a=(3/(\(random)+3))*(\(random)/(3+\(random))/(1/4))",picture: UIImage(named:""),ansPic : UIImage(named:""),cal : ""),
        QNA(Ques:"某氣相反應系 ，PA、PB表A、B氣體之分壓。已知25°C之下，1atm且等莫耳之A和B混合作用之反應速率為S，若溫度壓力不變，但A莫耳數改為3,B莫耳數改為\(randomNumber)時，反應速率為aS，則a值為若干？【85北聯】",Ans:"",picture: UIImage(named:""),ansPic : UIImage(named:""),cal : ""),]
    

    
    
        switch quesNo {
        case 10:
            quesNo = 1
        default:
            quesNo = quesNo + 1 //起始次數=1
        }
        
        switch QNAarrayNo {
        case 9:
            QNAarrayNo = 0
            
            
        default:
            QNAarrayNo = QNAarrayNo + 1 //起始次數=1
        }
        
        switch ansArrayNo {
        case 9:
            ansArrayNo = 0
        default:
            ansArrayNo = ansArrayNo + 1 //起始次數=1
        }
        
        
        
        questionNoLabel.isHidden = false //次數不要隱藏
        questionNoLabel.text = "\(quesNo)."//題號
        ques.text = QnaArray[QNAarrayNo ].Ques
        quespic.image = QnaArray[QNAarrayNo].picture
        gradelabel.isHidden = false
    
        let ans:String = QnaArray[QNAarrayNo ].Ans
        let answerIndex = arc4random_uniform(4)
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAns" {
            
            let random = randomNumber
            var QnaArray = [
                QNA(Ques:"",Ans:"",picture: UIImage(named:""),ansPic : UIImage(named:""),cal : ""),
                QNA(Ques:"某氣相反應系 ，PA、PB表A、B氣體之分壓。已知25°C之下，1atm且等莫耳之A和B混合作用之反應速率為S，若溫度壓力不變，但A莫耳數改為3,B莫耳數改為\(randomNumber)時，反應速率為aS，則a值為若干？【85北聯】",Ans:"a=(3/(\(random)+3))*(\(random)/(3+\(random))/(1/4))",picture: UIImage(named:""),ansPic : UIImage(named:""),cal : ""),
                QNA(Ques:"某氣相反應系 ，PA、PB表A、B氣體之分壓。已知25°C之下，1atm且等莫耳之A和B混合作用之反應速率為S，若溫度壓力不變，但A莫耳數改為3,B莫耳數改為\(randomNumber)時，反應速率為aS，則a值為若干？【85北聯】",Ans:"",picture: UIImage(named:""),ansPic : UIImage(named:""),cal : ""),]
            

            
    
            
            
            
        }
      
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        }
    
    
    
    weak var ＱuestionLab: UILabel!
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
