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
    
    /**
     *
     * Array of UI in order to render in subview
     *
    **/
    public lazy var arrSlider:[UISlider] = [sliderR!, sliderG!, sliderB!, sliderA!]
    public lazy var arrUI:[UIView] = [labelAreaRGBA!, labelDescriptionRGBA!] + arrSlider
    
    // Interface options
    public var labelAreaRGBAValue:CGFloat = 180
    public var labelDescriptionRGBAValue:CGFloat = 50
    public var sliderValue:CGFloat = 30
    public var baseYSlider = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Instance the components and render it to view, using view.subview
        createAndRenderComp();
    }
    
    public func createAndRenderComp() {
        
        //MARK: Labels
        labelAreaRGBA = UILabel(frame: CGRect(x: (self.view.frame.width  - labelAreaRGBAValue) / 2,
                                              y: 100,
                                              width: labelAreaRGBAValue,
                                              height: labelAreaRGBAValue))
        labelAreaRGBA?.textAlignment = NSTextAlignment.center
        labelAreaRGBA?.backgroundColor = UIColor.gray
        
        labelDescriptionRGBA = UILabel(frame: CGRect(x: labelDescriptionRGBAValue,
                                                     y: 300,
                                                     width: self.view.frame.width - (2 * labelDescriptionRGBAValue),
                                                     height: labelDescriptionRGBAValue))
        
        //MARK: Sliders
        sliderR = UISlider(frame: CGRect(x: sliderValue,
                                          y: CGFloat(baseYSlider + 50),
                                          width: self.view.frame.width - (2 * sliderValue),
                                          height: sliderValue))
        
        sliderG = UISlider(frame: CGRect(x: sliderValue,
                                          y: CGFloat(baseYSlider + 100),
                                          width: self.view.frame.width - (2 * sliderValue),
                                          height: sliderValue))
        
        sliderB = UISlider(frame: CGRect(x: sliderValue,
                                          y: CGFloat(baseYSlider + 150),
                                          width: self.view.frame.width - (2 * sliderValue),
                                          height: sliderValue))
        sliderA = UISlider(frame: CGRect(x: sliderValue,
                                          y: CGFloat(baseYSlider + 200),
                                          width: self.view.frame.width - (2 * sliderValue),
                                          height: sliderValue))
        
        for x in 0..<arrSlider.count {
            // Set Maximum value in order to see inicial color
            arrSlider[x].maximumValue = 255
            
            //MARK: Events
             arrSlider[x].addTarget(self, action: #selector(onChangeHandler), for: .valueChanged)
        }
        
        // Set opacity to 1
        sliderA?.value = 255
        
        // Render components
        for a in arrUI {
         self.view.addSubview(a)
        }
    }
    
    @objc
    func onChangeHandler() {
        // set Color with new instance
        labelAreaRGBA?.backgroundColor = UIColor.init(red: CGFloat(sliderR!.value / 255),
                                                      green: CGFloat(sliderG!.value / 255),
                                                      blue: CGFloat(sliderB!.value / 255),
                                                      alpha: CGFloat(sliderA!.value / 255))
        
        //set RGBA label
        labelDescriptionRGBA?.text = "R: \(Int(sliderR!.value)) G: \(Int(sliderG!.value)) B: \(Int(sliderB!.value)) A: \(Int(sliderA!.value / 255))"
    }
}
