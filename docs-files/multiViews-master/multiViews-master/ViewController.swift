//
//  ViewController.swift
//  multiViews-master
//
//  Created by Aluno_Istec on 04/06/2019.
//  Copyright © 2019 bgabrielma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btn(_ sender: UIButton) {
        performSegue(withIdentifier: "viewC2", sender: txtf.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let viewTwo = segue.destination as? ViewTwoController else {
            return;
        }
        
        let data = sender

        guard data as? String != "O GALAO" else {
            
            let alert = UIAlertController(title: "Erro", message: "É O GALÃO", preferredStyle: .alert)
            
            let btn = UIAlertAction(title: "Ya, ele é uma treta", style: .cancel, handler: nil)
            
            alert.addAction(btn)
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        viewTwo.dataReceived = sender as? String ?? "Empty"
    }
}

