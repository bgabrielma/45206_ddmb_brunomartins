//
//  FirstViewController.swift
//  t3-pokedex-bgabrielma-v2
//
//  Created by Bruno Martins on 20/06/2019.
//  Copyright © 2019 Bruno Martins. All rights reserved.
//

import UIKit
/*
class FirstViewController: UIViewController,
UINavigationControllerDelegate,
UIImagePickerControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    var image = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func importImage(_ sender: Any) {
        image.delegate = self
        image.sourceType = .photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
        {
            // After it is complete
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let imagePicked = info[.originalImage] as? UIImage else {
            return
        }
        
        self.myImageView.image = imagePicked
        self.dismiss(animated: true, completion: nil)
    }
}
*/
class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



