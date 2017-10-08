//
//  ChemistryDetailTableViewController.swift
//  chem1
//
//  Created by heroshi on 2017/5/14.
//  Copyright © 2017年 heroshi. All rights reserved.
//

import UIKit
import AVFoundation

extension UIImageView {
    /* var imageSize: CGSize {
     if let image = image {
     return AVMakeRect(aspectRatio: image.size, insideRect: bounds).size
     }
     return CGSize.zero
     }*/
}
class ChemistryDetailTableViewController: UITableViewController {
    
    @IBOutlet var sendanswer: UITableView!
    
    
    var 多選 = "tableview 的 selection 選multiple + open var indexPathsForSelectedRows: [IndexPath]? { get } // returns nil or a set of index paths representing the sections and rows of the selection."
    
    var 隨機 = "cityArray.count"
    
    
    //@IBOutlet var chemistryImageView: UIImageView!
    //@IBOutlet weak var questionLabel: UILabel!
    
    //        @IBOutlet var tableView:UITableView!
    
    
    
    var ansLabel:Int = -1
    var chemistry: Chemistry!
    
    var optionBtnS:String = ""
    var pressTimes = 0
    
    @IBOutlet weak var ansBtnLabel: UIButton!
    
    var notenumber = 0
    var nowQues = 0
    var subjectNumber = 0
    
    
    //寫圖片高度func
    /*    func cellheight () -> Int {
     if cell.equImage.image!.size.width > UIScreen.main.bounds.width  {
     for constraint in cell.equImage.constraints
     {
     if constraint.identifier == "imageHeight" {
     cell.equImage.removeConstraint(constraint)
     break //找到就不用再找
     }
     }
     let height = cell.equImage.image!.size.width * 0.75 * UIScreen.main.bounds.height / cell.equImage.image!.size.height
     let heightConstraint = cell.equImage.widthAnchor.constraint(equalToConstant: height)
     heightConstraint.identifier = "imageHeight"
     heightConstraint.isActive = true
     print(cell.equImage.image!.size)
     }
     
     }
     */
    
    var nextQues = 0
    var chemistryarray = [""]
    var btn = "no"
    //    @IBOutlet var showAns:UILabel!
    @IBOutlet weak var showAns: UIImageView!
    
    var ShowAnsLabel = ""
    var yourAnsLabel = ""

    var DownPoints = 0.8//倒扣
    var point = 2.0//配分
    var grade = 0.0//總分
    var gradeLabel = ""
    
    
    @IBAction func showAnsBtn(_ sender: Any) {
        let userDefault = UserDefaults.standard
        notenumber = userDefault.integer(forKey: "notenumber")
        let line = array[notenumber]
        chemistryarray = line.components(separatedBy: "\t")
        ans = chemistryarray[7]
        ShowAnsLabel = "答案：\(ans)"
        yourAnsLabel = "你選了：\(finalans)"
        
        self.tableView.reloadData()
    }
    
    @IBAction func nextQuesBtn(_ sender: Any) {
        ShowAnsLabel = ""
        yourAnsLabel = ""
        //下一頁的時候答案空白
        ansA = ""
        ansB = ""
        ansC = ""
        ansD = ""
        ansE = ""
        ansF = ""
        ansG = ""
        ansH = ""
        ansI = ""
        ansJ = ""
        finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
        print("finalans in nextQuesBtn=\(finalans)")
        btn = "yes"
        
        //從userDefault裡讀nextQues
        let userDefault = UserDefaults.standard
        let name = userDefault.string(forKey: "nextQues")
        
        notenumber = notenumber + 1 //按一下題號加一
        nowQues = notenumber //防止下一題超過範圍
        nextQues = notenumber + 1
        
        if nextQues >= array.count {
            notenumber = 0
            nowQues = notenumber
            nextQues = 1
        }
        print("array=\(array.count)")
        
        //寫入新的nextQues
        userDefault.set("\(notenumber)", forKey: "nowQues")
        userDefault.synchronize()
        userDefault.set("\(notenumber)", forKey: "notenumber")
        userDefault.synchronize()
        userDefault.set("\(nextQues)", forKey: "nextQues")
        userDefault.synchronize()
        
        self.tableView.allowsMultipleSelection = true
        
        //       chemistryImageView.image = UIImage(named: image)
        
        // tableView.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        
        // title = name
        
        navigationController?.hidesBarsOnSwipe = false
        
        // questionLabel.linebreakMode = NSLinebreakMode.byWordWrapping
        //題目自動換行
        
        //http://www.jianshu.com/p/f409dfc15ba1
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        
        //讀c2.txt
        let url = Bundle.main.url(forResource: "c2", withExtension: "txt")
        let str = try! String(contentsOf: url!)
        array = str.components(separatedBy: "\n")
        
        //讀subjectNumber
        subjectNumber = userDefault.integer(forKey: "subjectNumber")
        switch subjectNumber {
        case 1:
            //            if notenumber = {}
            print("chinese")
        case 2:
            print("english")
        case 3:
            print("math")
        case 4:
            print("science")
        case 5:
            print("social")
        default:
            print("list")
        }
        
        
        let line = array[notenumber]
        chemistryarray = line.components(separatedBy: "\t")
        
        //        print("lineArray[3]=\(chemistryarray[3])")
        print("下一題題目\(question)")
        //        print("btn in \(question)")
        
        groupQues = chemistryarray[0]
        groupQuesPic = chemistryarray[1]
        groupQuesPic2 = chemistryarray[2]
        question = chemistryarray[3]
        equimage = chemistryarray[4]
        equimage2 = chemistryarray[5]
        type = chemistryarray[6]
        //ans = chemistryarray[7]
        A = chemistryarray[8]
        equimageA = chemistryarray[9]
        figImageA = chemistryarray[10]
        B = chemistryarray[11]
        equimageB = chemistryarray[12]
        figImageB = chemistryarray[13]
        C = chemistryarray[14]
        equimageC = chemistryarray[15]
        figImageC = chemistryarray[16]
        D = chemistryarray[17]
        equimageD = chemistryarray[18]
        figImageD = chemistryarray[19]
        E = chemistryarray[20]
        equimageE = chemistryarray[21]
        figImageE = chemistryarray[22]
        F = chemistryarray[23]
        equimageF = chemistryarray[24]
        //figImageF = chemistryarray[25]
        //        isVisited = chemistryarray[26]
        G = chemistryarray[27]
        equimageG = chemistryarray[28]
        figImageG = chemistryarray[29]
        H = chemistryarray[30]
        equimageH = chemistryarray[31]
        figImageH = chemistryarray[32]
        I = chemistryarray[33]
        equimageI = chemistryarray[34]
        figImageFI = chemistryarray[35]
        J = chemistryarray[36]
        equimageJ = chemistryarray[37]
        figImageJ = chemistryarray[38]
        
        self.tableView.reloadData()
        
        print("in nextQuesBtn \(nextQues)")
        print("E=\(E)")
        navigationItem.title = type
    }
    
    
    var array = [""]
    //    var chemistryarray = [""]
    var chem : String = ""
    var c2:String = ""
    
    override func viewDidLoad() {
        print("viewDidLoad")
        super.viewDidLoad()
        self.tableView.allowsMultipleSelection = true
        //       chemistryImageView.image = UIImage(named: image)
        
        // tableView.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        
        // title = name
        
        navigationController?.hidesBarsOnSwipe = false
        
        // questionLabel.linebreakMode = NSLinebreakMode.byWordWrapping
        //題目自動換行
        
        //http://www.jianshu.com/p/f409dfc15ba1
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        //從userDefault裡叫出nextQues下一題的編號
        let userDefault = UserDefaults.standard
        let name = userDefault.string(forKey: "nextQues")
        
        //讀c2.txt
        let url = Bundle.main.url(forResource: "c2", withExtension: "txt")
        let str = try! String(contentsOf: url!)
        
        array = str.components(separatedBy: "\n")
        
        //從userDefault裡讀notenumber
        notenumber = userDefault.integer(forKey: "notenumber")
        
        print("notenumber in vdl \(notenumber)")
        let line = array[notenumber]
        chemistryarray = line.components(separatedBy: "\t")
        
        //        print("lineArray[3]=\(chemistryarray[3])")
        print("viewDidLoadend in question \(question)")
        //        print("btn in \(question)")
        
        groupQues = chemistryarray[0]
        groupQuesPic = chemistryarray[1]
        groupQuesPic2 = chemistryarray[2]
        question = chemistryarray[3]
        equimage = chemistryarray[4]
        equimage2 = chemistryarray[5]
        type = chemistryarray[6]
        ans = chemistryarray[7]
        A = chemistryarray[8]
        equimageA = chemistryarray[9]
        figImageA = chemistryarray[10]
        B = chemistryarray[11]
        equimageB = chemistryarray[12]
        figImageB = chemistryarray[13]
        C = chemistryarray[14]
        equimageC = chemistryarray[15]
        figImageC = chemistryarray[16]
        D = chemistryarray[17]
        equimageD = chemistryarray[18]
        figImageD = chemistryarray[19]
        E = chemistryarray[20]
        equimageE = chemistryarray[21]
        figImageE = chemistryarray[22]
        F = chemistryarray[23]
        equimageF = chemistryarray[24]
        //figImageF = chemistryarray[25]
        //        isVisited = chemistryarray[26]
        G = chemistryarray[27]
        equimageG = chemistryarray[28]
        figImageG = chemistryarray[29]
        H = chemistryarray[30]
        equimageH = chemistryarray[31]
        figImageH = chemistryarray[32]
        I = chemistryarray[33]
        equimageI = chemistryarray[34]
        figImageFI = chemistryarray[35]
        J = chemistryarray[36]
        equimageJ = chemistryarray[37]
        figImageJ = chemistryarray[38]
        self.tableView.reloadData()
        //self.tableView.cellForRow(at: IndexPath)
        //navigationController的標題
        navigationItem.title = type
        
    }
    
    /*
     //http://www.jianshu.com/p/f409dfc15ba1
     override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
     return 10
     }
     
     //自动决定真实高度http://www.jianshu.com/p/f409dfc15ba1
     override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return UITableViewAutomaticDimension
     }
     
     var prototypeCell: ChemistryDetailTableViewCell!
     */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    /*
     override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
     // Social Sharing Button
     let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: { (action, indexPath) -> Void in
     })
     shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
     return [ shareAction]
     }
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableView
    
    var numberOfRowsInSection = 8
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        if E == "Na" && equimageE == "Na" {//a~d4+2
            numberOfRowsInSection = 6
        }
        else if F == "Na" && equimageF == "Na" {//a~e
            numberOfRowsInSection = 7
        }
        else if G == "Na" && equimageG == "Na" {//a~f
            numberOfRowsInSection = 8
        }
        else if J != "Na" || equimageJ != "Na" {
            numberOfRowsInSection = 12
        }
        return numberOfRowsInSection
    }
    
    
    //@IBOutlet weak var groepQuesPic: UIImageView!
    
    var groupQues = ""
    var groupQuesPic = ""
    var groupQuesPic2 = ""
    var question = ""
    var type = ""
    //var year = ""
    var ans = ""
    var isVisited = ""
    var equimage = ""
    var equimage2 = ""
    var A = ""
    var equimageA = ""
    var figImageA = ""
    // var noteA = ""
    var B = ""
    var equimageB = ""
    var figImageB = ""
    //var noteB = ""
    var C = ""
    var equimageC = ""
    var figImageC = ""
    // var noteC = ""
    var D = ""
    var equimageD = ""
    var figImageD = ""
    // var noteD = ""
    var E = ""
    var equimageE = ""
    var figImageE = ""
    var F = ""
    var equimageF = ""
    var figImageF = ""
    var G = ""
    var equimageG = ""
    var figImageG = ""
    var H = ""
    var equimageH = ""
    var figImageH = ""
    var I = ""
    var equimageI = ""
    var figImageFI = ""
    var J = ""
    var equimageJ = ""
    var figImageJ = ""
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt")
        var cell : ChemistryDetailTableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "ansOnlyWord", for: indexPath) as! ChemistryDetailTableViewCell
        
        //http://www.jianshu.com/p/f409dfc15ba1
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        // Configure the cell...
        //cellForRowAt
        switch indexPath.row {
        case 0:
            
            cell = tableView.dequeueReusableCell(withIdentifier: "questionOnly", for: indexPath) as! ChemistryDetailTableViewCell
            //群組
            if groupQues != "Na" {
                cell.groupQueslabel.text = groupQues
                cell.groupQueslabel.isHidden = false
                
            }
            else {
                cell.groupQueslabel.isHidden = true
            }
            
            //群組圖一
            if groupQuesPic != "Na" {
                cell.groupQuesPic.isHidden = false
                cell.groupQuesPic.image = UIImage(named: "\(groupQuesPic)")
                print(groupQuesPic)
                // if cell.groupQuesPic.image!.size.width > UIScreen.main.bounds.width  {
                for constraint in cell.groupQuesPic.constraints
                {
                    if constraint.identifier == "imageHeight" {
                        cell.groupQuesPic.removeConstraint(constraint)
                        break //找到就不用再找
                    }
                }
                let height = cell.groupQuesPic.image!.size.width * 0.75 * UIScreen.main.bounds.height / cell.groupQuesPic.image!.size.height
                let heightConstraint = cell.groupQuesPic.widthAnchor.constraint(equalToConstant: height)
                heightConstraint.identifier = "imageHeight"
                heightConstraint.isActive = true
                // }
                //if cell.groupQuesPic.image!.size.height > UIScreen.main.bounds.height  {
                for constraint in cell.groupQuesPic.constraints
                {
                    if constraint.identifier == "imageWidth" {
                        cell.groupQuesPic.removeConstraint(constraint)
                        break //找到就不用再找
                    }
                }
                let width = cell.groupQuesPic.image!.size.height * UIScreen.main.bounds.width / cell.groupQuesPic.image!.size.width
                let widthConstraint = cell.groupQuesPic.heightAnchor.constraint(equalToConstant: width)
                widthConstraint.identifier = "imageWidth"
                widthConstraint.isActive = true
                //}
                print("有群組圖1")
            }
            else {
                cell.groupQuesPic.isHidden = true
                print("no群組圖1")
            }
            
            if groupQuesPic2 != "Na" {
                cell.groupQuesPic2.isHidden = false
                
                cell.groupQuesPic2.image = UIImage(named: "\(groupQuesPic2)")
                //if cell.equImage2.image!.size.width > UIScreen.main.bounds.width  {
                for constraint in cell.groupQuesPic2.constraints
                {
                    if constraint.identifier == "imageHeight" {
                        cell.groupQuesPic2.removeConstraint(constraint)
                        break //找到就不用再找
                    }
                }
                let height = cell.groupQuesPic2.image!.size.width * 0.75 * UIScreen.main.bounds.height / cell.groupQuesPic2.image!.size.height
                let heightConstraint = cell.groupQuesPic2.widthAnchor.constraint(equalToConstant: height)
                heightConstraint.identifier = "imageHeight"
                heightConstraint.isActive = true
                //}
                //if cell.groupQuesPic2.image!.size.height > UIScreen.main.bounds.height  {
                for constraint in cell.groupQuesPic2.constraints
                {
                    if constraint.identifier == "imageWidth" {
                        cell.groupQuesPic2.removeConstraint(constraint)
                        break //找到就不用再找
                    }
                }
                let width = cell.groupQuesPic2.image!.size.height * UIScreen.main.bounds.width / cell.groupQuesPic2.image!.size.width
                let widthConstraint = cell.groupQuesPic2.heightAnchor.constraint(equalToConstant: width)
                widthConstraint.identifier = "imageWidth"
                widthConstraint.isActive = true
                //}
                print("有群組圖2")
            }
            else {
                cell.groupQuesPic2.isHidden = true
                print("沒群組圖2")
                
            }
            
            if question != "Na" {
                cell.valueLabel.text = question
                cell.valueLabel.isHidden = false
            }
            else {
                cell.valueLabel.isHidden = true
            }
            //圖一
            if equimage != "Na" {
                cell.equImage.isHidden = false
                cell.equImage.image = UIImage(named: "\(equimage)")
                print("equimage")
                print("named=\(equimage)")
                //如果圖檔比ui的還大,依照比例縮小
                //if cell.equImage.image!.size.width > UIScreen.main.bounds.width  {
                for constraint in cell.equImage.constraints
                {
                    if constraint.identifier == "imageHeight" {
                        cell.equImage.removeConstraint(constraint)
                        break //找到就不用再找
                    }
                }
                let height = cell.equImage.image!.size.width * 0.75 * UIScreen.main.bounds.height / cell.equImage.image!.size.height
                let heightConstraint = cell.equImage.widthAnchor.constraint(equalToConstant: height)
                heightConstraint.identifier = "imageHeight"
                heightConstraint.isActive = true
                //}
                //if cell.equImage.image!.size.height > UIScreen.main.bounds.height {
                for constraint in cell.equImage.constraints
                {
                    if constraint.identifier == "imageWidth" {
                        cell.equImage.removeConstraint(constraint)
                        break //找到就不用再找
                    }
                }
                let width = cell.equImage.image!.size.height * UIScreen.main.bounds.width / cell.equImage.image!.size.width
                let widthConstraint = cell.equImage.heightAnchor.constraint(equalToConstant: width)
                widthConstraint.identifier = "imageWidth"
                widthConstraint.isActive = true
                //}
                print("named=\(equimage)")
                print("圖1的\(equimage.size)")
                print(cell.equImage.image!.size)
                
            }
            else{
                cell.equImage.isHidden = true
                print("no圖1")
            }
            //圖2
            if equimage2 != "Na" {
                cell.equImage2.isHidden = false
                cell.equImage2.image = UIImage(named: "\(equimage2)")
                //如果圖檔比ui的還大,依照比例縮小
                //if cell.equImage2.image!.size.width > UIScreen.main.bounds.width  {
                for constraint in cell.equImage2.constraints
                {
                    if constraint.identifier == "imageHeight" {
                        cell.equImage2.removeConstraint(constraint)
                        break //找到就不用再找
                    }
                }
                let height = cell.equImage2.image!.size.width * 0.75 * UIScreen.main.bounds.height / cell.equImage2.image!.size.height
                let heightConstraint = cell.equImage2.widthAnchor.constraint(equalToConstant: height)
                heightConstraint.identifier = "imageHeight"
                heightConstraint.isActive = true
                //}
                //if cell.equImage2.image!.size.height > UIScreen.main.bounds.height  {
                for constraint in cell.equImage2.constraints
                {
                    if constraint.identifier == "imageWidth" {
                        cell.equImage2.removeConstraint(constraint)
                        break //找到就不用再找
                    }
                }
                let width = cell.equImage2.image!.size.height * UIScreen.main.bounds.width / cell.equImage2.image!.size.width
                let widthConstraint = cell.equImage2.heightAnchor.constraint(equalToConstant: width)
                widthConstraint.identifier = "imageWidth"
                widthConstraint.isActive = true
                //}
                
                print("named=\(equimage2)")
                print("圖2\(equimage2.size)")
                print(cell.equImage2.image!.size)
            }
            else{
                cell.equImage2.isHidden = true
                //print("no圖22222222")
                
            }
            return cell
        //
        case 1:
            print("cell.isSelected=\(cell.isSelected)")
            if A != "Na" || equimageA != "Na"{
                cell = tableView.dequeueReusableCell(withIdentifier: "ansWithequ", for: indexPath) as! ChemistryDetailTableViewCell
                cell.accessoryType = .none
                cell.fieldLabel.text = "A"
                //有文字
                if A != "Na" {
                    cell.valueLabel.text = A
                    cell.valueLabel.isHidden = false
                }
                else{
                    cell.valueLabel.isHidden = true
                }
                //有方程式或一個圖4
                if equimageA != "Na" {
                    cell.equImage.image = UIImage(named: "\(equimageA)")
                    cell.equImage.isHidden = false
                    
                    //如果圖檔比ui的還大,依照比例縮小
                    if cell.equImage.image!.size.width > UIScreen.main.bounds.width  {
                        for constraint in cell.equImage.constraints
                        {
                            if constraint.identifier == "imageHeight" {
                                cell.equImage.removeConstraint(constraint)
                                break //找到就不用再找
                            }
                        }
                        let height = cell.equImage.image!.size.width * 0.75 * UIScreen.main.bounds.height / cell.equImage.image!.size.height
                        let heightConstraint = cell.equImage.widthAnchor.constraint(equalToConstant: height)
                        heightConstraint.identifier = "imageHeight"
                        heightConstraint.isActive = true
                    }
                }
                else{
                    cell.equImage.isHidden = true
                }
            }
            else { //非選題
                cell = tableView.dequeueReusableCell(withIdentifier: "ansOnlyWord", for: indexPath) as! ChemistryDetailTableViewCell
                let textfieldtxt = cell.notetextfield.text
                finalans = textfieldtxt!
                //cell.notetextfield.text = ""
                print("finalans in case1=\(finalans)")
            }
            return cell
            
        case 2:
            if A != "Na" || equimageA != "Na"{
                cell = tableView.dequeueReusableCell(withIdentifier: "ansWithequ", for: indexPath) as! ChemistryDetailTableViewCell
                cell.accessoryType = .none
                cell.fieldLabel.text = "B"
                //有文字
                if B != "Na" {
                    cell.valueLabel.text = B
                    cell.valueLabel.isHidden = false
                }
                else{
                    cell.valueLabel.isHidden = true
                }
                //有方程式或一個圖4
                if equimageB != "Na" {
                    cell.equImage.image = UIImage(named: "\(equimageB)")
                    cell.equImage.isHidden = false
                    
                    //如果圖檔比ui的還大,依照比例縮小
                    if cell.equImage.image!.size.width > UIScreen.main.bounds.width  {
                        for constraint in cell.equImage.constraints
                        {
                            if constraint.identifier == "imageHeight" {
                                cell.equImage.removeConstraint(constraint)
                                break //找到就不用再找
                            }
                        }
                        let height = cell.equImage.image!.size.width * 0.75 * UIScreen.main.bounds.height / cell.equImage.image!.size.height
                        let heightConstraint = cell.equImage.widthAnchor.constraint(equalToConstant: height)
                        heightConstraint.identifier = "imageHeight"
                        heightConstraint.isActive = true
                    }
                }
                else{
                    cell.equImage.isHidden = true
                }
            }
            else {
                cell = tableView.dequeueReusableCell(withIdentifier: "nil", for: indexPath) as! ChemistryDetailTableViewCell
            }
            return cell        case 3:
                if A != "Na" || equimageA != "Na"{
                    cell = tableView.dequeueReusableCell(withIdentifier: "ansWithequ", for: indexPath) as! ChemistryDetailTableViewCell
                    
                    cell.accessoryType = .none
                    
                    
                    cell.fieldLabel.text = "C"
                    //有文字
                    if C != "Na" {
                        cell.valueLabel.text = C
                        cell.valueLabel.isHidden = false
                    }
                    else{
                        cell.valueLabel.isHidden = true
                    }
                    //有方程式或一個圖4
                    if equimageC != "Na" {
                        cell.equImage.image = UIImage(named: "\(equimageC)")
                        cell.equImage.isHidden = false
                        
                        //如果圖檔比ui的還大,依照比例縮小
                        if cell.equImage.image!.size.width > UIScreen.main.bounds.width  {
                            for constraint in cell.equImage.constraints
                            {
                                if constraint.identifier == "imageHeight" {
                                    cell.equImage.removeConstraint(constraint)
                                    break //找到就不用再找
                                }
                            }
                            let height = cell.equImage.image!.size.width * 0.75 * UIScreen.main.bounds.height / cell.equImage.image!.size.height
                            let heightConstraint = cell.equImage.widthAnchor.constraint(equalToConstant: height)
                            heightConstraint.identifier = "imageHeight"
                            heightConstraint.isActive = true
                        }
                    }
                    else{
                        cell.equImage.isHidden = true
                    }
                }
                else {
                    cell = tableView.dequeueReusableCell(withIdentifier: "nil", for: indexPath) as! ChemistryDetailTableViewCell
                }
                return cell
            
        case 4:
            if A != "Na" || equimageA != "Na"{
                
                cell = tableView.dequeueReusableCell(withIdentifier: "ansWithequ", for: indexPath) as! ChemistryDetailTableViewCell
                
                cell.accessoryType = .none
                cell.fieldLabel.text = "D"
                //有文字
                if D != "Na" {
                    cell.valueLabel.text = D
                    cell.valueLabel.isHidden = false
                }
                else{
                    cell.valueLabel.isHidden = true
                }
                //有方程式或一個圖4
                if equimageD != "Na" {
                    cell.equImage.image = UIImage(named: "\(equimageD)")
                    cell.equImage.isHidden = false
                    
                    //如果圖檔比ui的還大,依照比例縮小
                    if cell.equImage.image!.size.width > UIScreen.main.bounds.width  {
                        for constraint in cell.equImage.constraints
                        {
                            if constraint.identifier == "imageHeight" {
                                cell.equImage.removeConstraint(constraint)
                                break //找到就不用再找
                            }
                        }
                        let height = cell.equImage.image!.size.width * 0.75 * UIScreen.main.bounds.height / cell.equImage.image!.size.height
                        let heightConstraint = cell.equImage.widthAnchor.constraint(equalToConstant: height)
                        heightConstraint.identifier = "imageHeight"
                        heightConstraint.isActive = true
                    }
                }
                else{
                    cell.equImage.isHidden = true
                }
            }
            else {
                cell = tableView.dequeueReusableCell(withIdentifier: "nil", for: indexPath) as! ChemistryDetailTableViewCell
            }
            return cell
        case 5:
            
            if A != "Na" || equimageA != "Na"{//選擇題
                if E != "Na" || equimageE != "Na" {
                    cell = tableView.dequeueReusableCell(withIdentifier: "ansWithequ", for: indexPath) as! ChemistryDetailTableViewCell
                    
                    cell.accessoryType = .none
                    cell.fieldLabel.text = "E"
                    
                    if E != "Na"  {
                        cell.valueLabel.text = E
                        cell.valueLabel.isHidden = false
                        
                    }
                    else{
                        cell.valueLabel.isHidden = true
                    }
                    
                    if equimageE != "Na"  {
                        cell.equImage.isHidden = false
                        cell.equImage.image = UIImage(named: "\(equimageE)")
                        if cell.equImage.image!.size.width > UIScreen.main.bounds.width  {
                            for constraint in cell.equImage.constraints
                            {
                                if constraint.identifier == "imageHeight" {
                                    cell.equImage.removeConstraint(constraint)
                                    break //找到就不用再找
                                }
                            }
                            let height = cell.equImage.image!.size.width * 0.75 * UIScreen.main.bounds.height / cell.equImage.image!.size.height
                            let heightConstraint = cell.equImage.widthAnchor.constraint(equalToConstant: height)
                            heightConstraint.identifier = "imageHeight"
                            heightConstraint.isActive = true
                        }
                    }
                    else{
                        cell.equImage.isHidden = true
                    }
                }
                    
                else {//Ｅ沒圖或文字就顯示下一題
                    
                    cell = tableView.dequeueReusableCell(withIdentifier: "nextQues", for: indexPath) as! ChemistryDetailTableViewCell
            cellID = "nextQues"                    
        
                    print("ans=\(ans)")
                    
                    if ans != ""{
                        cell.grade.text = gradeLabel
                        cell.ansLabel.text = ShowAnsLabel
                        cell.yourAnsLabel.text = yourAnsLabel
                        cell.ansLabel.isHidden = false
                        print("ShowAnsLabel=\(ShowAnsLabel)")
                    }
                }
            }
            return cell
            
        case 6:
            if F != "Na" || equimageF != "Na" {
                cell = tableView.dequeueReusableCell(withIdentifier: "ansWithequ", for: indexPath) as! ChemistryDetailTableViewCell
                
                cell.accessoryType = .none
                
                cell.fieldLabel.text = "F"
                
                if F != "Na"  {
                    cell.valueLabel.text = F
                    cell.valueLabel.isHidden = false
                    
                }
                else{
                    cell.valueLabel.isHidden = true
                }
                
                if equimageF != "Na"  {
                    cell.equImage.isHidden = false
                    cell.equImage.image = UIImage(named: "\(equimageF)")
                    if cell.equImage.image!.size.width > UIScreen.main.bounds.width  {
                        for constraint in cell.equImage.constraints
                        {
                            if constraint.identifier == "imageHeight" {
                                cell.equImage.removeConstraint(constraint)
                                break //找到就不用再找
                            }
                        }
                        let height = cell.equImage.image!.size.width * 0.75 * UIScreen.main.bounds.height / cell.equImage.image!.size.height
                        let heightConstraint = cell.equImage.widthAnchor.constraint(equalToConstant: height)
                        heightConstraint.identifier = "imageHeight"
                        heightConstraint.isActive = true
                    }
                }
                else{
                    cell.equImage.isHidden = true
                }
            }
                //（F）沒圖或文字Ｆ就顯示下一題
            else {
                            cell = tableView.dequeueReusableCell(withIdentifier: "nextQues", for: indexPath) as! ChemistryDetailTableViewCell
            cellID = "nextQues"                    
    
                if ans != ""{
                    cell.grade.text = gradeLabel
                    cell.ansLabel.text = ShowAnsLabel
                    cell.yourAnsLabel.text = yourAnsLabel
                    print("ShowAnsLabel=\(ShowAnsLabel)")
                }     // cell.heightAnchor = 30
            }
            return cell
            
        case 7:
            
            if G != "Na" || equimageG != "Na"{
                cell = tableView.dequeueReusableCell(withIdentifier: "ansWithequ", for: indexPath) as! ChemistryDetailTableViewCell
                
                cell.accessoryType = .none
                
                
                cell.fieldLabel.text = "G"
                //有文字
                if G != "Na" {
                    cell.valueLabel.text = G
                    cell.valueLabel.isHidden = false
                }
                else{
                    cell.valueLabel.isHidden = true
                }
                //有方程式或一個圖4
                if equimageG != "Na" {
                    cell.equImage.image = UIImage(named: "\(equimageG)")
                    cell.equImage.isHidden = false
                    
                    //如果圖檔比ui的還大,依照比例縮小
                    if cell.equImage.image!.size.width > UIScreen.main.bounds.width  {
                        for constraint in cell.equImage.constraints
                        {
                            if constraint.identifier == "imageHeight" {
                                cell.equImage.removeConstraint(constraint)
                                break //找到就不用再找
                            }
                        }
                        let height = cell.equImage.image!.size.width * 0.75 * UIScreen.main.bounds.height / cell.equImage.image!.size.height
                        let heightConstraint = cell.equImage.widthAnchor.constraint(equalToConstant: height)
                        heightConstraint.identifier = "imageHeight"
                        heightConstraint.isActive = true
                    }
                }
                else{
                    cell.equImage.isHidden = true
                }
            }
            else {
                            cell = tableView.dequeueReusableCell(withIdentifier: "nextQues", for: indexPath) as! ChemistryDetailTableViewCell
            cellID = "nextQues"                    
    
                if ans != ""{
                    cell.grade.text = gradeLabel
                    cell.ansLabel.text = ShowAnsLabel
                        cell.yourAnsLabel.text = yourAnsLabel
                    print("ShowAnsLabel=\(ShowAnsLabel)")
                }  }
            return cell
            
        case 8:
            
            if H != "Na" || equimageH != "Na"{
                cell = tableView.dequeueReusableCell(withIdentifier: "ansWithequ", for: indexPath) as! ChemistryDetailTableViewCell
                
                cell.accessoryType = .none
                cell.fieldLabel.text = "H"
                //有文字
                if H != "Na" {
                    cell.valueLabel.text = H
                    cell.valueLabel.isHidden = false
                }
                else{
                    cell.valueLabel.isHidden = true
                }
                //有方程式或一個圖4
                if equimageB != "Na" {
                    cell.equImage.image = UIImage(named: "\(equimageJ)")
                    cell.equImage.isHidden = false
                    
                    //如果圖檔比ui的還大,依照比例縮小
                    if cell.equImage.image!.size.width > UIScreen.main.bounds.width  {
                        for constraint in cell.equImage.constraints
                        {
                            if constraint.identifier == "imageHeight" {
                                cell.equImage.removeConstraint(constraint)
                                break //找到就不用再找
                            }
                        }
                        let height = cell.equImage.image!.size.width * 0.75 * UIScreen.main.bounds.height / cell.equImage.image!.size.height
                        let heightConstraint = cell.equImage.widthAnchor.constraint(equalToConstant: height)
                        heightConstraint.identifier = "imageHeight"
                        heightConstraint.isActive = true
                    }
                }
                else{
                    cell.equImage.isHidden = true
                }
            }
            else {
                            cell = tableView.dequeueReusableCell(withIdentifier: "nextQues", for: indexPath) as! ChemistryDetailTableViewCell
            cellID = "nextQues"                    
    
                if ans != ""{
                    cell.grade.text = gradeLabel
                    cell.ansLabel.text = ShowAnsLabel
                        cell.yourAnsLabel.text = yourAnsLabel
                    print("ShowAnsLabel=\(ShowAnsLabel)")
                }  }
            return cell
            
        case 9:
            if I != "Na" || equimageI != "Na"{
                cell = tableView.dequeueReusableCell(withIdentifier: "ansWithequ", for: indexPath) as! ChemistryDetailTableViewCell
                
                cell.accessoryType = .none
                
                
                cell.fieldLabel.text = "I"
                //有文字
                if I != "Na" {
                    cell.valueLabel.text = I
                    cell.valueLabel.isHidden = false
                }
                else{
                    cell.valueLabel.isHidden = true
                }
                //有方程式或一個圖4
                if equimageB != "Na" {
                    cell.equImage.image = UIImage(named: "\(equimageH)")
                    cell.equImage.isHidden = false
                    
                    //如果圖檔比ui的還大,依照比例縮小
                    if cell.equImage.image!.size.width > UIScreen.main.bounds.width  {
                        for constraint in cell.equImage.constraints
                        {
                            if constraint.identifier == "imageHeight" {
                                cell.equImage.removeConstraint(constraint)
                                break //找到就不用再找
                            }
                        }
                        let height = cell.equImage.image!.size.width * 0.75 * UIScreen.main.bounds.height / cell.equImage.image!.size.height
                        let heightConstraint = cell.equImage.widthAnchor.constraint(equalToConstant: height)
                        heightConstraint.identifier = "imageHeight"
                        heightConstraint.isActive = true
                    }
                }
                else{
                    cell.equImage.isHidden = true
                }
            }
            return cell
            
        case 10:
            if J != "Na" || equimageJ != "Na"{
                cell = tableView.dequeueReusableCell(withIdentifier: "ansWithequ", for: indexPath) as! ChemistryDetailTableViewCell
                
                cell.accessoryType = .none
                
                
                cell.fieldLabel.text = "J"
                //有文字
                if J != "Na" {
                    cell.valueLabel.text = J
                    cell.valueLabel.isHidden = false
                }
                else{
                    cell.valueLabel.isHidden = true
                }
                //有方程式或一個圖4
                if equimageB != "Na" {
                    cell.equImage.image = UIImage(named: "\(equimageI)")
                    cell.equImage.isHidden = false
                    
                    //如果圖檔比ui的還大,依照比例縮小
                    if cell.equImage.image!.size.width > UIScreen.main.bounds.width  {
                        for constraint in cell.equImage.constraints
                        {
                            if constraint.identifier == "imageHeight" {
                                cell.equImage.removeConstraint(constraint)
                                break //找到就不用再找
                            }
                        }
                        let height = cell.equImage.image!.size.width * 0.75 * UIScreen.main.bounds.height / cell.equImage.image!.size.height
                        let heightConstraint = cell.equImage.widthAnchor.constraint(equalToConstant: height)
                        heightConstraint.identifier = "imageHeight"
                        heightConstraint.isActive = true
                    }
                }
                else{
                    cell.equImage.isHidden = true
                }
            }
            return cell
            
        default:
                        cell = tableView.dequeueReusableCell(withIdentifier: "nextQues", for: indexPath) as! ChemistryDetailTableViewCell
            cellID = "nextQues"
                        cell.grade.text = gradeLabel
                        cell.ansLabel.text = ShowAnsLabel
                        cell.yourAnsLabel.text = yourAnsLabel
            return cell
        }
        
        /*  if let indexPaths = tableView.indexPathsForSelectedRows {
         for i in 0 ..< indexPaths.count {
         
         var thisPath = indexPaths[i] as NSIndexPath
         let cell = tableView.cellForRow(at: thisPath as IndexPath)
         if let cell = cell {
         // Do something with the cell
         // If it's a custom cell, downcast to the proper type
         }
         var labelshow = thisPath[1]
         labelshow += labelshow
         print("\(thisPath)")
         }
         }
         */
        
        //cell.accessoryType = .checkmark
        //cell.selectionStyle = .gray // to prevent cells from being "highlighted"
        
    }
    
    var ansA:String = ""
    var ansB:String = ""
    var ansC:String = ""
    var ansD:String = ""
    var ansE:String = ""
    var ansF:String = ""
    var ansG:String = ""
    var ansH:String = ""
    var ansI:String = ""
    var ansJ:String = ""
    var finalans:String = ""
    var cellID = ""
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 || cellID == "nextQues" {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            //print("\(indexPath[1])")
        }
        
        //如了題目以外都可以勾
        if indexPath.row != 0 {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            //print("\(indexPath[1])")
        }
        
        var cell : ChemistryDetailTableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "ansOnlyWord", for: indexPath) as! ChemistryDetailTableViewCell
        
        //題目只有文字1
        if equimage == ""  {
            cell = tableView.dequeueReusableCell(withIdentifier: "questionOnly", for: indexPath) as! ChemistryDetailTableViewCell
            cell.accessoryType = .none
        }
        print("")
        
        // return cell
        
        
        switch indexPath.row {
            
        case 1:
            if A == "Na" && equimageA == "Na"{
                //cell = tableView.dequeueReusableCell(withIdentifier: "ansOnlyWord", for: indexPath) as! ChemistryDetailTableViewCell
                cell.notetextfield.text = ""
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
                print("accessoryType = .none")
            }
            ansA = "A"
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
            print("finalans in didSelectRowAt \(finalans)")
            
        case 2:
            if A == "Na" && equimageA == "Na"{
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
            }
            ansB = "B"
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
            print("\(finalans)")
            
        case 3:
            if A == "Na" && equimageA == "Na"{
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
            }
            ansC = "C"
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
            print("\(finalans)")
            
        case 4:
            if A == "Na" && equimageA == "Na"{
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
            }
            ansD = "D"
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
            print("\(finalans)")
            
        case 5:
             if E != "Na" || equimageE != "Na" {
                ansE = "E"
                finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
                print("\(finalans)")
            }
            else {
                ansE = ""
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
                print("\(finalans)")
            }
            
        case 6:
            if F != "Na" || equimageF != "Na" {
                ansF = "F"
                finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
                print("\(finalans)")
            }
            else {
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
                print("\(finalans)")
            }
            
        case 7:
            if G != "Na" || equimageG != "Na"{
                ansG = "G"
                finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
                print("\(finalans)")
            }
            else {
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
                print("\(finalans)")
            }
        case 8:
            if H != "Na" || equimageH != "Na" {
                ansH = "H"
                finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
                print("\(finalans)")
            }
            else {
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
                print("\(finalans)")
            }
        case 9:
            if I != "Na" || equimageI != "Na"{
                ansI = "I"
                finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
                print("\(finalans)")
            }
            else {
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
                print("\(finalans)")
            }
        case 10:
            if J != "Na" || equimageJ != "Na" {
                ansJ = "J"
                finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
                print("\(finalans)")
            }
            else {
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
                print("\(finalans)")
            }
        default:
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            //cell.fieldLabel.text = ""
            //cell.valueLabel.text = ""
        }
        
        
        // ansLabel = tableView.indexPathsForSelectedRows: [IndexPath]? { get }
        // ansBtnLabel.setTitle("已選答案：\(ansLabel)。確認送出", for:  .normal )
        
        finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
        
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        
        var cell : ChemistryDetailTableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "ansOnlyWord", for: indexPath) as! ChemistryDetailTableViewCell
        
        //題目只有文字1
        if equimage == ""  {
            cell = tableView.dequeueReusableCell(withIdentifier: "questionOnly", for: indexPath) as! ChemistryDetailTableViewCell
            cell.accessoryType = .none
        }
        
        switch indexPath.row {
        case 0:
            cell.accessoryType = .none
        case 1:
            ansA = ""
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
            print("\(finalans)")
            
        case 2:
            ansB = ""
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
            print("\(finalans)")
            
        case 3:
            ansC = ""
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
            print("\(finalans)")
            
        case 4:
            ansD = ""
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
            print("\(finalans)")
            
        case 5:
            ansE = ""
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
            print("\(finalans)")
            
        case 6:
            
            ansF = ""
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
            print("\(finalans)")
            
        case 7:
            ansG = ""
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
            print("\(finalans)")
            
        case 8:
            ansH = ""
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
            print("\(finalans)")
            
        case 9:
            ansI = ""
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
            print("\(finalans)")
            
        case 10:
            ansJ = ""
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ
            print("\(finalans)")
            
        default:
            print("\(finalans)")
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            finalans = ansA + ansB + ansC + ansD + ansE + ansF + ansG + ansH + ansI + ansJ            //  print("\(indexPath)")
        }
    }
    
    var ansPicName = ""
    
    @IBAction func sendAnswerBtn(_ sender: Any) {
        print("sendAnswerBtn")
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //destinationController1.chemistry = chemistrys[indexPath.row]
        //        if segue.identifier == "ansRight"{
        let destinationController = segue.destination as! noteViewController
        
        //答對
        if finalans == ans {
            //                destinationController.ansPic.image = UIImage(named:"\(#imageLiteral(resourceName: "ans2 拷貝"))")
            destinationController.notenumber = notenumber
            ansPicName = "ans1"
        }
            //答錯
        else {
            destinationController.notenumber = notenumber
            ansPicName = "ans2"
            //                destinationController.ansPic.image = UIImage(named:"\(#imageLiteral(resourceName: "ansr 拷貝"))")
        }
        print("ans=\(ans),finalans in prepare=\(finalans)")
        print(ansPicName)
        destinationController.ansPicname = ansPicName
        // destinationController.chemistry = chemistrys[indexPath.row]
        //        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
