//
//  ViewTwoController.swift
//  multiViews-master
//
//  Created by Aluno_Istec on 04/06/2019.
//  Copyright © 2019 bgabrielma. All rights reserved.
//

import UIKit

class ViewTwoController: UIViewController {
    
    var dataReceived:String?
    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl.text = self.dataReceived
    }
    
    @IBAction func btn(_ sender: Any) {
        performSegue(withIdentifier: "viewC1", sender: nil)
    }

}
