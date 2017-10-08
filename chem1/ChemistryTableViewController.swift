//
//  ChemistryTableViewController.swift
//  chem1
//
//  Created by heroshi on 2017/5/14.
//  Copyright © 2017年 heroshi. All rights reserved.
//




//用之前的單字app來分行,找write來做筆記

import UIKit

class ChemistryTableViewController: UITableViewController {
    
    @IBAction func goBack(segue:UIStoryboardSegue) {
//寫入@IBAction func goBack(segue:UIStoryboardSegue) {},在起點拉線到上面的exit
    }
    
    var notenumber = 0
    var subjectNumber = 0 //選科的話!=0,不選科=0

    var chemistryarray = [""]
    var btn = "no"
    //    var chemistryarray = [""]
    var array = [""]
    var subjectQuesStartNumber = 0
    var sectionNumber = 0
    var subjectQuesEndNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
//讀c2.txt的array
//在vdl讀在class裡都可以用
        let url = Bundle.main.url(forResource: "c2", withExtension: "txt")
        let str = try! String(contentsOf: url!)
        array = str.components(separatedBy: "\n")
        if array[array.count - 1].characters.count == 0 {
            array.remove(at: array.count - 1)
        }
        
//從userDefault裡讀notenumber
        let userDefault = UserDefaults.standard
        notenumber = userDefault.integer(forKey: "notenumber")
        subjectNumber = userDefault.integer(forKey: "subjectNumber")
        subjectQuesStartNumber = userDefault.integer(forKey: "subjectQuesStartNumber")

//如果是list（notenumber=選的題號）
//不是選科目（notenumber=0）,array從[subjectQuesStartNumber]開始讀
        
        
//選list的時候subjectQuesStartNumber=0
//選分科的時候subjectQuesStartNumber = notenumber - 1
        if subjectQuesStartNumber != 0 { //選科目
//用來限制numberOfRowsInSection的個數
        sectionNumber = array.count - subjectQuesStartNumber + 1
        }
        else { //選列表
        sectionNumber = array.count
        }
    
//自動調整cell高
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
// Remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
//navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//navigationController?.hidesBarsOnSwipe = true//滑得時候把navigation bar隱藏
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    var arraycount = 0
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionNumber
    }
    
    var chem : String = ""
    var c2:String = ""
    var question = ""
    var type = ""
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
//讀c2.txt
        /*        let url = Bundle.main.url(forResource: "c2", withExtension: "txt")
         let str = try! String(contentsOf: url!)
         array = str.components(separatedBy: "\n")
         */
        
        //讀中文字數
/*        for ch in line.unicodeScalars {
            print(ch.value)
        }
 */
//最後一行是空白就刪除
        if array[array.count - 1].characters.count == 0 {
            array.remove(at: array.count - 1)
        }
        if subjectNumber == 0 {
            let line = array[indexPath.row]
            chemistryarray = line.components(separatedBy: "\t")
        }
        else {
            let line = array[indexPath.row + subjectQuesStartNumber - 1]
            chemistryarray = line.components(separatedBy: "\t")
        }
        print("indexPath.row=\(indexPath.row)")
        print("array.count=\(array.count)")
        print("subjectQuesStartNumber=\(subjectQuesStartNumber)")
        print("indexPath.row + subjectQuesStartNumber=\(indexPath.row+subjectQuesStartNumber)")
//            print("array[219].characters.count=\(array[219].characters.count)")
// print("chemistryarray.count=\(chemistryarray.count)")
        
        if indexPath.row < array.count {
            question = chemistryarray[3]
            type = chemistryarray[6]
   // print("cellForRowAt")
            print("question in cellForRowAt =\(question)")
        }
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ChemistryTableViewCell
// Configure the cell...
        cell.questionLabel.text = question
        cell.typeLabel.text = type        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        /*        if editingStyle == .delete {
 // Delete the row from the data source
         chemistrys.remove(at: indexPath.row)
         }
         
        tableView.deleteRows(at: [indexPath], with: .fade)
    */
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
// Social Sharing Button
        if subjectNumber == 0 {
            let line = array[indexPath.row]
            chemistryarray = line.components(separatedBy: "\t")
        }
        else {
            let line = array[indexPath.row + subjectQuesStartNumber - 1]
            chemistryarray = line.components(separatedBy: "\t")
        }
        if indexPath.row < array.count {
            question = chemistryarray[3]
            type = chemistryarray[6]
            // print("cellForRowAt")
            print("question in editActionsForRowAt =\(question)")
        }
        
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "分享或求救", handler: { (action, indexPath) -> Void in
            let defaultText = "Just finish:" + self.type + "#" + self.question
                let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            print(defaultText)
            print("self.question in cellForRowAt =\(self.question)")
        })
        
// Delete button
        /*        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete",handler: { (action, indexPath) -> Void in
         
 // Delete the row from the data source
         self.chemistrys.remove(at: indexPath.row)
         
         self.tableView.deleteRows(at: [indexPath], with: .fade)
         })
         */
        
//  shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
//deleteAction.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        
//return [deleteAction,  shareAction]
        return [shareAction]
        
    }
    
    // MARK: -

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showChemistryDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if subjectNumber == 0 { //選list的時候subjectNumber=0
                notenumber = indexPath.row//選list的時候
                let userDefault = UserDefaults.standard
                    userDefault.set("\(notenumber)", forKey: "notenumber")
                    userDefault.synchronize()
//                let destinationController = segue.destination as! ChemistryDetailTableViewController
//let destinationController1 = segue.destination as! noteViewController
// destinationController.chemistry = chemistrys[indexPath.row]
//                destinationController.notenumber = notenumber
//destinationController1.chemistry = chemistrys[indexPath.row]
                }
            else if subjectNumber != 0 { //選科的話subjectNumber!=0
                    //判斷選科的題目在array的號碼
                    print("else if subjectNumber != 0")
                    notenumber = indexPath.row + subjectQuesStartNumber - 1
print("prepare notenumber=\(notenumber), indexPath.row=\(indexPath.row)")
                    let userDefault = UserDefaults.standard
                    userDefault.set("\(notenumber)", forKey: "notenumber")
                    userDefault.synchronize()
                }
                }
        }
    }
}

