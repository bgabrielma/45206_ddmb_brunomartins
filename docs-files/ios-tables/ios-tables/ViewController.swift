//
//  ViewController.swift
//  ios-tables
//
//  Created by Aluno_Istec on 21/05/2019.
//  Copyright © 2019 ISTEC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var txt: UILabel!
    
    var arr:[String]?
    var arr2:[String]?
    var data:[[String]]?
    
    var titulos = ["Alunos", "Profs"]
    var setup:[Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arr = ["Gonçalo", "Rui"]
        arr2 = ["Gonçalo2", "Rui2"]
        data = [arr!, arr2!]
        setup = [arr!.count, arr2!.count]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return setup!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setup![section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.data![indexPath.section][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       self.txt.text = tableView.cellForRow(at: indexPath)?.textLabel?.text
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.titulos[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}

