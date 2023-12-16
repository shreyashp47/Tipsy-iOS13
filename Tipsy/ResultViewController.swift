//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Shreyash Pattewar on 16/12/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var detailLitel: UILabel!
    @IBOutlet weak var perPerson: UILabel!
    
    var result = "0.0"
       var tip = 10
       var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        perPerson.text = result
        detailLitel.text = "Split between \(split) people, with \(tip)% tip."

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
