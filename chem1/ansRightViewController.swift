//
//  ansRightViewController.swift
//  chem1
//
//  Created by heroshi on 2017/6/17.
//  Copyright © 2017年 heroshi. All rights reserved.
//

import UIKit

class ansRightViewController: UIViewController {
    var chemistry: Chemistry!
    
    var notenumber = 0
    
    @IBAction func noteBtn(_ sender: Any) {
        print("notenumber= \(notenumber)")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //destinationController1.chemistry = chemistrys[indexPath.row]
        
        if segue.identifier == "note"{
            let destinationController = segue.destination as! noteViewController
                    destinationController.notenumber = notenumber
        }
    }

    //拉線到上面的exit,在目的地寫入@IBAction func goBack(segue:UIStoryboardSegue) {}
    
    @IBAction func ansBtn(_ sender: Any) {
        
    }
    
    @IBOutlet weak var ansPic: UIImageView!
    var ansPicname:String = ""

    
    /*@IBAction func backToListBtn(_ sender: Any) {
   
        print("1")
//self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
  self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }*/
    
    /*
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        
            let destinationController = segue.destination as! answerViewController
            
           // destinationController.chemistry = chemistrys[indexPath.row]
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        self.ansPic.image = UIImage(named:"\(ansPicname)")
        //print("\(ansPicname)+1")
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
