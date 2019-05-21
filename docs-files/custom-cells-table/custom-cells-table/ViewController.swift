//
//  ViewController.swift
//  custom-cells-table
//
//  Created by Aluno_Istec on 21/05/2019.
//  Copyright © 2019 ISTEC. All rights reserved.
//

import UIKit

class pCell: UITableViewCell {
    
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var foto: UIImageView!
    
    override func awakeFromNib() {
        self.foto.contentMode = .scaleToFill;
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.img.image = UIImage(named: "noImg")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! pCell;
        
        cell.foto.image = UIImage(named: "foto1")
        cell.nome.text = "Prato 1"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 122
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! pCell
        
        self.img.image = cell.foto.image
        self.lbl.text = cell.nome.text
    }
}

