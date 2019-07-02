//
//  FirstViewController.swift
//  t3-pokedex-bgabrielma-v2
//
//  Created by Bruno Martins on 20/06/2019.
//  Copyright © 2019 Bruno Martins. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet weak var tableViewDataToBeInserted: UITableView!
    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var imageViewPreview: UIImageView!
    var imagePicker = UIImagePickerController()
    
    // Picker data for type and sub type
    var pickerData:[[EnumType]] = [EnumType.allCases, EnumType.allCases]
    var pickerAttackType:[EnumType] = EnumType.allCases
    var pickerType:EnumType?
    var pickerSubType:EnumType?
    
    // Aux for pickers process
    var attackNameTyped:String?
    var pokemonEvolutionNameChosen:String?
    var pokemonType:EnumType?
    var pokemonSubType:EnumType?
    var willInsertAttack:Bool = false
    
    // Components
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtXP: UITextField!
    @IBOutlet weak var txtHP: UITextField!
    @IBOutlet weak var txtForca: UITextField!
    @IBOutlet weak var txtDesc: UITextField!
    
    var arrayComponents:[UITextField] = []
    
    // Table attacks and evolutions information data props
    var attacksToBeInserted = [Attack]() {
        didSet {
            print("Inserido -> \(self.attacksToBeInserted.count)")
            
            // reset
            self.willInsertAttack = false
            self.attackNameTyped = ""
            
            // Reload data after this process being complete -> the dialog
            self.tableViewDataToBeInserted.reloadData()
        }
        willSet {
            
        }
    }
    var evolutionsToBeInserted:[Pokemon]?
    var headers:[String] = ["Ataques inseridos", "Evoluções inseridas"]
    
    /**
 
        @see EnumPickers
     
    **/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // load some props
        
        //prevent unwrapping issues
        self.pokemonType = .NORMAL
        self.pokemonSubType = .NORMAL
        
        self.arrayComponents = [self.txtNome ,self.txtXP, self.txtHP, self.txtForca, self.txtDesc]
        
        AppUtils.configureTabBar(view: self, badgeColor: UIColor.white, barTintColor: AppUtils.primaryColor, tintColor: UIColor.white, unSelectedItemColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.6))
    }
}

extension FirstViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let imagePicked = info[.originalImage] as? UIImage else {
            return
        }
        
        self.imageViewPreview.image = imagePicked
        self.dismiss(animated: true, completion: nil)
    }
}

// Pickers

extension FirstViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
            case EnumTags.InputFormPickerAttacks.rawValue: self.attackNameTyped = self.pickerData[component][row].rawValue
            default:
                do {
                    // Type and subtype picker
                    if(component == 0) {
                        self.pokemonType = self.pickerData[component][row]
                    }
                    else {
                        self.pokemonSubType = self.pickerData[component][row]
                    }
                }
        }
        
        print("\(self.pokemonType!) e \(self.pokemonSubType!)")
        
    }
}

extension FirstViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        var count = 0
        switch pickerView.tag {
            case EnumTags.InputFormPickerAttacks.rawValue: count = 1
            default: count = pickerData.count
        }
        return count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var count = 0
        switch pickerView.tag {
            case EnumTags.InputFormPickerAttacks.rawValue: count = pickerAttackType.count
            default: count = pickerData[component].count
        }
        return count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var value:String?
        switch pickerView.tag {
            case EnumTags.InputFormPickerAttacks.rawValue: value = pickerAttackType[row].rawValue
            default: value = pickerData[component][row].rawValue
        }
        return value!
    }
}

// Table View Controller
extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows = 0
        
        switch section {
            case 0:
                numberOfRows = self.attacksToBeInserted.count
            case 1:
                numberOfRows = self.evolutionsToBeInserted?.count ?? 0
            default:
                numberOfRows = 0
        }
        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "formCell", for: indexPath)
        
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12.0)
        
        switch indexPath.section {
            case 0:
                cell.textLabel?.text = "\(self.attacksToBeInserted[indexPath.row].designation) - \(self.attacksToBeInserted[indexPath.row].type.rawValue)"
            case 1:
                cell.textLabel?.text = self.evolutionsToBeInserted?[indexPath.row].nome ?? ""
            default:
                cell.textLabel?.text = ""
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.headers.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.headers[section]
    }
}


// First View Controller actions
extension FirstViewController {
    @IBAction func alertDialog(_ sender: Any) {
        var title:String?
        let alert = UIAlertController(title: "---", message: "\n\n\n\n\n\n", preferredStyle: .alert)
        
        alert.isModalInPopover = true
        let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140))
        
        switch (sender as! UIButton).tag {
        case EnumTags.InputFormBtnAddAttacks.rawValue:
            do {
                alert.addTextField { (textField: UITextField) in
                    textField.placeholder = "Attack name"
                }
                pickerFrame.tag = EnumTags.InputFormPickerAttacks.rawValue
                title = "Adicionar ataques"
                self.willInsertAttack = true
            }
        default:
            do {
                title = "Adicionar evoluções"
                pickerFrame.tag = EnumTags.InputFormPickerEvolutions.rawValue
                self.willInsertAttack = false
            }
        }
        
        //Update title
        alert.title = title!
        
        pickerFrame.delegate = self
        pickerFrame.dataSource = self
        
        alert.view.addSubview(pickerFrame)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) {alertAction -> Void in
            // reset
            self.willInsertAttack = false
            self.attackNameTyped = ""
        })
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { (alertAction) -> Void in
            
            if(self.willInsertAttack) {
                let txt = (alert.textFields?[0])?.text ?? "not defined"
                self.attacksToBeInserted.append(Attack(designation: txt, type: EnumType(rawValue: self.attackNameTyped ?? "Normal")!))
            }
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func uploadImage(_ sender: Any) {
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = false
        self.present(self.imagePicker, animated: true)
        {
            // After it is complete
        }
    }
    
    @IBAction func savePokemon(_ sender: Any) {
        self.arrayComponents.forEach { elem in
            if elem.text!.isEmpty {
                
                // show error alert
                AppUtils.showAlert(view: self, title: "Erro na submissão", message: "Campos em falta. Preencha-os e tente novamente.")
                return
            }
        }
        guard let image = self.imageViewPreview, image.image != UIImage(named: "preview") else {
            AppUtils.showAlert(view: self, title: "Erro na submissão", message: "Imagem referente ao pokemon necessária.")
            return
        }
        
        if self.attacksToBeInserted.isEmpty {
            AppUtils.showAlert(view: self, title: "Erro na submissão", message: "Insira, pelo menos, um ataque para o pokemon \(self.txtNome.text!)")
            return
        }
        AppUtils.pokemons.append(
            Pokemon(_nome: self.txtNome.text!, _xp: Int(self.txtXP.text!)!,
                    _hp: Int(self.txtHP.text!)!,
                    _description: self.txtDesc.text!,
                    _attacks: self.attacksToBeInserted,
                    _type: self.pokemonType!,
                    _subType: self.pokemonSubType!,
                    _strengh: Int(self.txtForca.text!)!,
                    _image: self.imageViewPreview.image!))
        
        let successAlert = AppUtils.createAlert(title: "Submissão de dados", message: "Submissão de dados realizada com sucesso.")
        self.present(successAlert, animated: true){
            // Reset components
            self.arrayComponents.forEach { elem in
                elem.text = ""
            }
            self.attacksToBeInserted.removeAll()
            self.evolutionsToBeInserted?.removeAll()
            self.imageViewPreview.image = UIImage(named: "preview")
            self.pokemonType = .NORMAL
            self.pokemonSubType = .NORMAL
            self.willInsertAttack = false
            self.typePicker.selectRow(0, inComponent: 0, animated: true)
            self.typePicker.selectRow(0, inComponent: 1, animated: true)
        }
    }
}
