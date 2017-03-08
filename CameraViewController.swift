//
//  CameraViewController.swift
//  Lic
//
//  Created by Ivor D. Addo on 3/5/17.
//  Copyright © 2017 Marquette University. All rights reserved.
//

import UIKit
import Firebase

class CameraViewController: UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
    
{

    @IBOutlet weak var selectedImage: UIImageView!
    
    //Take a picture
    @IBAction func takeAPicture(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imgPicker = UIImagePickerController()
            imgPicker.delegate = self
            imgPicker.sourceType = .camera
            imgPicker.allowsEditing = false
            //show the camera app
            self.present(imgPicker, animated: true, completion: nil)
            
            
        }
        
    }
    
    //Choose a picture from your library
    @IBAction func chooseAPicture(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imgPicker = UIImagePickerController()
            imgPicker.delegate = self
            imgPicker.sourceType = .photoLibrary
            imgPicker.allowsEditing = false //Allow Editing (cropping etc)
            //show the Photo Library
            self.present(imgPicker, animated: true, completion: nil)
            
        }
        
        
        
    }
    
    //Saves picture to gallery
    @IBAction func savePicture(_ sender: UIBarButtonItem) {
        let imageData = UIImageJPEGRepresentation(selectedImage.image!, 0.6)
        let compressedJPEG  = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPEG!, nil, nil, nil)
        savePhotoAlert()
    }
    
    //Turns ImageView into image you just took
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imgImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectedImage.image = imgImage
        } else {
            print("Something went wrong, check with support and try again")
        }
        dismiss(animated: true, completion: nil)
    }
    
    //Add cancel button
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: {_ in})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func savePhotoAlert() {
        let ac = UIAlertController(title: "Photo Saved!", message: "Your Photo was saved successfully!", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }



}
