//
//  SettingsViewController.swift
//  cocoatest
//
//  Created by stagiaire on 05/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var lStepShowElements: UILabel!
    @IBOutlet weak var stepShowElements: UIStepper!
    @IBOutlet weak var switchShowElements: UISwitch!
    
    @IBAction func showControlesChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "showAffiches")
    }
    
    
    @IBAction func stepShowElements(_ sender: UIStepper) {
        UserDefaults.standard.set(sender.value, forKey: "nbElementsShow")
        lStepShowElements.text = "Afficher les \(sender.value) éléments"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let db = UserDefaults.standard
        self.switchShowElements.isOn = db.bool(forKey: "showAffiches")
        self.stepShowElements.value = db.double(forKey: "nbElementsShow")
        self.lStepShowElements.text = "Afficher les \(self.stepShowElements.value) éléments"
    }

    @IBAction func btnCloseSettings(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
