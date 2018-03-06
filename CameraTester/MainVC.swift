//
//  ViewController.swift
//  CameraTester
//
//  Created by Robert Wais on 3/5/18.
//  Copyright © 2018 Robert Wais. All rights reserved.
//

import UIKit


class MainVC: UIViewController {

    
    var image: UIImage!
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true
        // Do any additional setup after loading the view, typically from a nib.
        //Sarah is hot
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Shows an image
    @IBAction func pressedBtn(_ sender: Any) {
    }
    
}

extension MainVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBAction func btnPressed(_ sender: UIButton){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        if sender.tag == 0 {
            imagePicker.sourceType = .camera
            self.present(imagePicker,animated: true, completion: nil)
        }else if sender.tag == 1{
                print("2")
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker,animated: true, completion: nil)
        }else if sender.tag == 2 {
            if image != nil {
            self.performSegue(withIdentifier: "showImage", sender: self)
            }else{
                let alert = UIAlertController(title: "Error", message: "No image Selected", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            }
        }else if sender.tag == 3 {
            if image != nil{
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
            } else {
                let alert = UIAlertController(title: "Error", message: "No image Selected", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            }
        
        }
        
        
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let shownImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = shownImage
        image = shownImage
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImage"{
            
            
            print("HERE-----------")
            var vc = segue.destination as! ImageVC
            print("\(imageView.description)")
            vc.image = image
        }
    }
    
}
