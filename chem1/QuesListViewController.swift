//
//  QuesListViewController.swift
//  chem1
//
//  Created by heroshi on 2017/4/9.
//  Copyright © 2017年 heroshi. All rights reserved.
//
// Chemistry

import UIKit

class ChemistryTableViewController: UITableViewController {
    
    var chemistrys:[Chemistry] = [
        Chemistry(question: " 有關酶催化反應，下列敘述何者不正確？", type: "98指考", ans: "",btnA : "酶為生物體內的催化劑，但也可萃取出來用於工業食品催化劑", btnB : "溫度保持在正常體溫下，酶催化效果最好", btnC: "酶分子皆為巨大的蛋白質分子", btnD: "酶分子表面任何地方皆可發生催化作用",btnE:"",  isVisited: false),
        Chemistry(question: "二級反應速率常數k之單位為：",type: "88北聯",  ans: "C",btnA: "M．s－1",btnB: "M－2．s－1",btnC: "M－1．s－1", btnD : "M2．s－1",btnE:"以上皆是",  isVisited: false),
        Chemistry(question: "下列何項的性質會影響化學反應速率常數的大小？",type:"93指考-預", ans: "B",btnA : "反應總級數和溫度",btnB :"反應物的性質和溫度",btnC: "反應限量試劑的濃度及其級數",btnD: "所有反應物的濃度和反應總級數",  btnE:"以上皆是",  isVisited: false),
        Chemistry(question: "化合物A(g)與B(g)反應生成C(g)，其反應式如下：2 A(g)＋2 B(g)→3 C(g)(已知此反應的反應速率式可表示為r＝k[A]2 [B] )。王同學做了兩次實驗。第一次將化合物A(g)及B(g)各0.1莫耳置於一個500毫升的容器中反應。在相同的溫度下，做第二次實驗，將0.2莫耳的化合物A(g)及0.1莫耳的化合物B(g)置於一個1000毫升的容器中反應。試問第二次實驗的反應初速率為第一次的幾倍？", type:"96指考", ans:"C" ,btnA :"1/8",btnB :"1/4",btnC :"1/2",btnD : "不變",btnE:"2", isVisited: false),
        
        ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //自動調整cell高
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        // Remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chemistrys.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ChemistryTableViewCell
        
        // Configure the cell...
        cell.questionLabel.text = chemistrys[indexPath.row].question
        // cell.thumbnailImageView.image = UIImage(named: chemistrys[indexPath.row].image)
        cell.typeLabel.text = chemistrys[indexPath.row].type
        
        cell.accessoryType = chemistrys[indexPath.row].isVisited ? .checkmark : .none
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // Delete the row from the data source
            chemistrys.remove(at: indexPath.row)
        }
        
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        /*
         // Social Sharing Button
         let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: { (action, indexPath) -> Void in
         
         let defaultText = "Just checking in at " + self.chemistrys[indexPath.row].name
         
         if let imageToShare = UIImage(named: self.chemistrys[indexPath.row].image) {
         let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
         self.present(activityController, animated: true, completion: nil)
         }
         })*/
        
        // Delete button
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete",handler: { (action, indexPath) -> Void in
            
            // Delete the row from the data source
            self.chemistrys.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        
        //shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        
        return [deleteAction, /* shareAction */]
        
    }
    
    // MARK: -
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showChemistryDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! ChemistryDetailTableViewController
                
                destinationController.chemistry = chemistrys[indexPath.row]
            }
        }
    }
    
}
