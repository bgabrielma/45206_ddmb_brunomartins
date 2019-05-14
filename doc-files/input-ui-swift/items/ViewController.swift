//
//  ViewController.swift
//  items
//
//  Created by Aluno_Istec on 14/05/19.
//  Copyright © 2019 swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var  lbl:UILabel?
    var btn:UIButton?
    lazy var arr:[UIView]=[lbl!,btn!]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let pad = 50
        let w = Int(self.view.frame.width) - (2 * pad)
        
     
        lbl = UILabel(frame: CGRect(x: 0, y: 110, width: w, height:100))
        lbl?.text = "adeus"
        lbl?.textColor = UIColor.black
        lbl?.backgroundColor = UIColor(red: 1, green: 1, blue: 0, alpha: 1)
        self.lbl?.textAlignment = NSTextAlignment.center
 
 
        
        btn = UIButton(frame: CGRect(x: 0, y: 210, width: w + 200, height:100))
        
        btn?.backgroundColor = UIColor.purple
        
        
        self.btn?.titleLabel?.text = "btn in code"
        
        btn?.addTarget(self, action: #selector(setcolor), for: .touchDown)
        btn?.addTarget(self, action: #selector(resetcolor), for: .touchUpInside)
      
        
        self.view.addSubview(lbl!)
        self.view.addSubview(btn!)
        
       
        
    }
    @objc
    func setcolor() {
        self.btn?.backgroundColor = UIColor.blue
    }
    
    @objc
    func resetcolor() {
        self.btn?.backgroundColor = UIColor.purple
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

