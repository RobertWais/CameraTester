//
//  ImageVC.swift
//  CameraTester
//
//  Created by Robert Wais on 3/5/18.
//  Copyright © 2018 Robert Wais. All rights reserved.
//

import UIKit

class ImageVC: UIViewController {

    @IBOutlet var saveBtn: UIButton!
    @IBOutlet var returnBtn: UIButton!
    @IBOutlet var imageView: UIImageView!
    var image: UIImage!
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        UIGraphicsBeginImageContext(imageView.bounds.size)
        imageView.image?.draw(in: CGRect(x: 0, y: 0,
                                         width: imageView.frame.size.width, height: imageView.frame.size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let activity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        present(activity, animated: true, completion: nil)
    }
    
    @IBAction func returnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true
        returnBtn.layer.cornerRadius = 35.0
        returnBtn.clipsToBounds = true
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.frame
        
        
        self.view.insertSubview(blurEffectView, at: 0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
