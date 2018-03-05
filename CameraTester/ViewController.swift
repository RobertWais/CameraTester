//
//  ViewController.swift
//  CameraTester
//
//  Created by Robert Wais on 3/5/18.
//  Copyright © 2018 Robert Wais. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressedBtn(_ sender: Any) {
    }
    
}

extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBAction func btnPressed(_ sender: UIButton){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        if sender.tag == 0 {
            imagePicker.sourceType = .camera
        }else if sender.tag == 1{
            print("2")
            imagePicker.sourceType = .photoLibrary
        }
        self.present(imagePicker,animated:true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let shownImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = shownImage
    }
    
}
