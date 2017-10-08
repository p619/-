//
//  ViewController.swift
//  chem1
//
//  Created by heroshi on 2017/2/28.
//  Copyright © 2017年 heroshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func review(_ sender: Any) {
        var notenumber = 0
        let subjectNumber = 0
        let userDefault = UserDefaults.standard
        notenumber = userDefault.integer(forKey: "notenumber")
        let path = NSHomeDirectory()
        print(path)
    }

    
    @IBAction func practice(_ sender: Any) {
        let notenumber = 0
        let subjectNumber = 0
        let userDefault = UserDefaults.standard
        userDefault.set("\(notenumber)", forKey: "notenumber")
        userDefault.synchronize()
        userDefault.set("\(subjectNumber)", forKey: "subjectNumber")
        userDefault.synchronize()
        let subjectQuesStartNumber = 0
        userDefault.set("\(subjectQuesStartNumber)", forKey: "subjectQuesStartNumber")
        userDefault.synchronize()
        let path = NSHomeDirectory()
        print(path)
    }
    
    @IBAction func subject(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

