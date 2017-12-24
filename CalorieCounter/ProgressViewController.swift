//
//  ProgressViewController.swift
//  CalorieCounter
//
//  Created by Mitchel on 4/9/16.
//  Copyright © 2016 Mitchel. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    
    let imagePicker : UIImagePickerController = UIImagePickerController()
    
    @IBAction func takePicture(_ sender: UIButton) {
        if UIImagePickerController.availableCaptureModes(for: .rear) != nil {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            imagePicker.cameraCaptureMode = .photo
            present(imagePicker, animated: true, completion: {})
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
