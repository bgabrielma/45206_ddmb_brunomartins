//
//  ViewController.swift
//  t2-colorpicker-bgabrielma
//
//  Created by Aluno_Istec on 14/05/2019.
//  Copyright © 2019 ISTEC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /**
     *
     * UI Components
     *
    **/
    public var sliderR, sliderG, sliderB, sliderA : UISlider?
    public var 	labelAreaRGBA, labelDescriptionRGBA : UILabel?
    
    // Interface options
    public var padding = 50;
    public var width = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.width = self.view.
        
        // Instance the components and render it to view, using view.subview
        createAndRenderComp();
        
    }
    
    public func createAndRenderComp() {
    }
}

