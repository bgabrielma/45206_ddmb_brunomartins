//
//  CreateAttackPicker.swift
//  t3-pokedex-bgabrielma-v2
//
//  Created by Bruno Martins on 27/06/2019.
//  Copyright © 2019 Bruno Martins. All rights reserved.
//

import UIKit

class CreateAttackPicker: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Picker data for attack type
    var pickerData:[[EnumType]] = [EnumType.allCases, EnumType.allCases]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Type and subtype picker selected")
    }
}
