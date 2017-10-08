//
//  noteViewController.swift
//  chem1
//
//  Created by heroshi on 2017/6/17.
//  Copyright © 2017年 heroshi. All rights reserved.
//

import UIKit

class noteViewController: UIViewController {

    var array = ["", "", "", "", ""]
    
    let path = NSHomeDirectory()
    //print(path)
    
    @IBOutlet weak var noteLabel1: UILabel!
    @IBOutlet weak var notetextfield: UITextField!
    
    var notetextfield1:String = ""
    @IBAction func saveBtn(_ sender: Any) {
        
        //var cell : addNoteTableViewCell

        notetextfield1 = notetextfield.text!
        noteLabel1.text = notetextfield1
/*
        let orderName = nameTextField.text!
        let orderDrink = drinkTextField.text!
        let orderDrinkIndex = drinkPickerView.selectedRow(inComponent: 0)
        let orderSuger = sugarArray[sugarSegmentedControl.selectedSegmentIndex]
        let orderIce = iceArray[iceSegmentedControl.selectedSegmentIndex]
        let orderNote = noteTextView.text!
        let todaysDate:NSDate = NSDate()
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy-MM-dd HH:mm"
        let orderDatetime:String = dateFormatter.string(from: todaysDate as Date)
        print("訂單名字-\(orderName), 訂購飲料-\(orderDrink), 訂購飲料編號-\(orderDrinkIndex), 甜度-\(orderSuger), 溫度-\(orderIce), 備註-\(orderNote), 訂購時間-\(orderDatetime)")
        */
        
 /*
        let url = URL(string: "https://sheetsu.com/apis/v1.0/ab8e38e50f31")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let dictionary = ["name":orderName, "drink":orderDrink, "drinkIndex":orderDrinkIndex, "sugar":orderSuger, "ice":orderIce, "note":orderNote, "orderDatetime":orderDatetime] as [String : Any]
        do {
            let data = try  JSONSerialization.data(withJSONObject: dictionary, options: [])
            let task = URLSession.shared.uploadTask(with: urlRequest, from: data, completionHandler: { (retData, res,
                err) in
                if let retData = retData {
                    do {
                        var dic = try JSONSerialization.jsonObject(with: retData, options: [])
                    }
                    catch { }
                } })
            task.resume()
        }
        catch { }
    } else {
    let alertController = UIAlertController(title: "您尚有資料尚未選擇", message: "記得再檢查一下哦！", preferredStyle: UIAlertControllerStyle.alert)
    
    let okAction = UIAlertAction(title: "確認", style: UIAlertActionStyle.default)
    alertController.addAction(okAction)
    self.present(alertController, animated: true, completion: nil)
    }

    */
    
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory,
                             in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("addNote.txt")
        (array as NSArray).write(to: url!, atomically:
            true)

        
        /*ch16 p.18
         let fileManager = FileManager.default
         let docUrls =
         fileManager.urls(for: .documentDirectory,
         in: .userDomainMask)
         let docUrl = docUrls.first
         let url = docUrl?.appendingPathComponent("     .txt")
         let array = NSArray(contentsOf: url!)
         for name in array! {
         }
         print("\(name)")
*/
        
    }
    
    var chemistry: Chemistry!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "addNote", withExtension: "txt")
        let content = try! String(contentsOf: url!)
        let lineArray = content.components(separatedBy: "\n")
        for line in lineArray {
            let bookInfoArray = line.components(separatedBy: "\t")
           // print(bookInfoArray[2])
        }
        
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
        return array.count
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
