//
//  noteViewController.swift
//  chem1
//
//  Created by heroshi on 2017/6/17.
//  Copyright © 2017年 heroshi. All rights reserved.
//

import UIKit

class noteViewController: UIViewController {

    var chemistry: Chemistry!

    //拉線到上面的exit,在目的地寫入@IBAction func goBack(segue:UIStoryboardSegue) {}
    
    @IBOutlet weak var noteLabel1: UILabel!
    @IBOutlet weak var notetextfield: UITextField!
    
    @IBOutlet weak var ansLabel: UILabel!
    var notetextfield1:String = ""
    @IBAction func saveBtn(_ sender: Any) {
        
        //var cell : addNoteTableViewCell
        notetextfield1 = notetextfield.text!
        noteLabel1.text = notetextfield1
        
        //用write存檔案
        let path = NSHomeDirectory()
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("addNote.txt")//改路徑
        //增加array內容,像字典用空格去讀不同的筆記
        var arrayInBtn = noteLabel1.text!
        array[notenumber] = arrayInBtn
        print("arrayInBtn：\(arrayInBtn)")
        (array as NSArray).write(to: url!, atomically: true)
        print(array[notenumber])
    }
    
    var notenumber = 0
    var array = [Any]()
    
    @IBOutlet weak var ansPic: UIImageView!
    var ansPicname:String = ""
    var ans = ""
    var question = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        //讀c2.txt
        let urlAns = Bundle.main.url(forResource: "c2", withExtension: "txt")
        let strAns = try! String(contentsOf: urlAns!)
        array = strAns.components(separatedBy: "\n")
        
        let line = array[notenumber]
        chemistryarray = (line as AnyObject).components(separatedBy: "\t")
        question = chemistryarray[3]
        ans = chemistryarray[7]
        ansLabel.text = "答案：\(ans)"
        //ansPic.image = UIImage(named: "\(ansPicname)")
        
        //讀addNote
        let url1 = Bundle.main.url(forResource: "addNote", withExtension: "txt")
        let str = try! String(contentsOf: url1!)
        array = str.components(separatedBy: "\n")
        //ch16 p.18
        //讀實機的筆記檔案
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("addNote.txt")//路徑
        let arrayInViewdidload = NSArray(contentsOf: url!)
        
        //array.removeAll()
        let path = NSHomeDirectory()
        print(path)
        
        //如果實機筆記沒東西就把addnote的寫入
        if arrayInViewdidload != nil {
            array = arrayInViewdidload as! [Any]
            print(path)
            
            if (arrayInViewdidload?.count)! == 0 {
            let url = Bundle.main.url(forResource: "addNote", withExtension: "txt")
            let str = try! String(contentsOf: url!)
            array = str.components(separatedBy: "\n")
            (array as NSArray).write(to: url!, atomically: true)                
                noteLabel1.text = arrayInViewdidload?[notenumber] as! String
            }
            else if (arrayInViewdidload?.count)! > 0 {
               // for i in 1 ... array.count/2 {
                 //   if array[2*i-1] as!Int == notenumber  {
                      //  print("\(array[notenumber])")
                        //array[notenumber] = ""
                
                        noteLabel1.text = arrayInViewdidload?[notenumber] as! String
                //print("arrayInViewdidload?[\(notenumber)]")
                   // }
                //}
            }
        }
 
//        print("\(noteLabel1.text!)")
 //       print("\(arrayInViewdidload?[0])")
//        print("\(String(describing: arrayInViewdidload))")
        print("notenumber= \(notenumber)")
//        tableView.reloadData()
/*
        //存圖片
        let imageData = UserDefaults.standard.data(forKey: "fateSettingImage")
        if imageData != nil {
            yourImage.image = UIImage.init(data: imageData!)
        }
        print("UserDefaults.standard.dat")
        */
        
        //questionLabel.text = chemistry.question

        // Do any additional setup after loading the view.
    }


    var nowQues = 0
    var nextQues = 0
    var chemistryarray = [""]
    var btn = "no"

    @IBAction func backQues(_ sender: Any) {
        
        btn = "yes"
        print("notenumber= \(notenumber)")
        print("nextQues= \(nextQues)")
        let userDefault = UserDefaults.standard
        let name = userDefault.string(forKey: "nextQues")
        
        
        //從userDefault裡寫想nextQues
        notenumber = notenumber + 1
        nowQues = notenumber
        nextQues = notenumber + 1
        //寫入新的nextQues
        userDefault.set("\(notenumber)", forKey: "nowQues")
        userDefault.synchronize()
        userDefault.set("\(notenumber)", forKey: "notenumber")
        userDefault.synchronize()
        userDefault.set("\(nextQues)", forKey: "nextQues")
        userDefault.synchronize()
        //self.presentingViewController?.dismiss(animated: true, completion: nil)
        
        /*
         // Social Sharing Button
         let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: { (action, indexPath) -> Void in
         let defaultText = "Just finish " + self.question
         if let quesToShare = UIImage(named: self.question) {
         let activityController = UIActivityViewController(activityItems: [defaultText, quesToShare], applicationActivities: nil)
         self.present(activityController, animated: true, completion: nil)
         }
         })
         */
    }
    
//用table多放幾個筆記
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "noteCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! addNoteTableViewCell
        
        // Configure the cell...
        //cell.noteLabel.text = chemistrys[indexPath.row].question
        // cell.thumbnailImageView.image = UIImage(named: chemistrys[indexPath.row].image)
        //cell.typeLabel.text = chemistrys[indexPath.row].type
        
        //cell.accessoryType = chemistrys[indexPath.row].isVisited ? .checkmark : .none
        
        return cell
    }

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//array.count
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
