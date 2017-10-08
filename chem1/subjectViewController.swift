//
//  subjectViewController.swift
//  chem1
//
//  Created by heroshi on 2017/8/22.
//  Copyright © 2017年 heroshi. All rights reserved.
//

import UIKit

class subjectViewController: UIViewController {
    let userDefault = UserDefaults.standard
    var notenumber = 0
    var subjectQuesStartNumber = 0
    //順序：自國英社數
    var years = 2//有兩年的題目
    
    var chineseQuesNo = 23//國文一年選擇題數
    @IBAction func chinese(_ sender: Any) {
        notenumber = years*(scienceQuesNo) + 1
        subjectQuesStartNumber = notenumber - 1
        //寫入三種數字
        userDefault.set("\(notenumber)", forKey: "subjectQuesStartNumber")
        userDefault.synchronize()
        userDefault.set("\(notenumber)", forKey: "notenumber")
        userDefault.synchronize()
        let subjectNumber = 1
        userDefault.set("\(subjectNumber)", forKey: "subjectNumber")
        userDefault.synchronize()
        print(notenumber)
    }
    
    var englishQuesNo = 56
    @IBAction func english(_ sender: Any) {
        notenumber = years*(scienceQuesNo+chineseQuesNo) + 1
        subjectQuesStartNumber = notenumber - 1
        userDefault.set("\(notenumber)", forKey: "subjectQuesStartNumber")
        userDefault.synchronize()
        userDefault.set("\(notenumber)", forKey: "notenumber")
        userDefault.synchronize()
        let subjectNumber = 2
        userDefault.set("\(subjectNumber)", forKey: "subjectNumber")
        userDefault.synchronize()
        
        print(notenumber)
    }
    var mathQuesNo = 13
    
    
    @IBAction func math(_ sender: Any) {
        notenumber = years*(scienceQuesNo+chineseQuesNo+englishQuesNo+socialQuesNo) + 1
        subjectQuesStartNumber = notenumber - 1
        userDefault.set("\(notenumber)", forKey: "subjectQuesStartNumber")
        userDefault.synchronize()
        userDefault.set("\(notenumber)", forKey: "notenumber")
        userDefault.synchronize()
        print(notenumber)
        let subjectNumber = 3
        userDefault.set("\(subjectNumber)", forKey: "subjectNumber")
        userDefault.synchronize()
    }
    var scienceQuesNo = 68
    
    @IBAction func science(_ sender: Any) { //1~68
        notenumber = 1
        subjectQuesStartNumber = notenumber - 1
        userDefault.set("\(notenumber)", forKey: "subjectQuesStartNumber")
        userDefault.synchronize()
        userDefault.set("\(notenumber)", forKey: "notenumber")
        userDefault.synchronize()
        let subjectNumber = 4
        userDefault.set("\(subjectNumber)", forKey: "subjectNumber")
        userDefault.synchronize()
        print(notenumber)
    }
    
    var socialQuesNo = 72
    @IBAction func social(_ sender: Any) {
        notenumber = years*(scienceQuesNo+chineseQuesNo+englishQuesNo) + 1
        subjectQuesStartNumber = notenumber - 1
        userDefault.set("\(notenumber)", forKey: "subjectQuesStartNumber")
        userDefault.synchronize()
        userDefault.set("\(notenumber)", forKey: "notenumber")
        userDefault.synchronize()
        let subjectNumber = 5
        userDefault.set("\(subjectNumber)", forKey: "subjectNumber")
        userDefault.synchronize()
        
        print(notenumber)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
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
