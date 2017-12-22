//
//  ViewController.swift
//  SeeFood
//
//  Created by Andreas Velounias on 22/12/2017.
//  Copyright © 2017 Andreas Velounias. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func libraryTapped(_ sender: UIBarButtonItem) {
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func detect(image: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading CoreML model failed")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            
            if error != nil {
                print(error!)
            }
            
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Casting failed")
            }
            
            print(results)
            
            if let firstResult = results.first {
                
                if firstResult.confidence > 0.2 {
                  
                    self.navigationItem.title = firstResult.identifier
                }
                
                else {
                    
                    self.navigationItem.title = "No Idea!"
                }
                
            }
        }
            
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imageView.image = pickedImage
            
            guard let ciImage = CIImage(image: pickedImage) else {
                fatalError("Could not convert to CIImage")
            }
            
            detect(image: ciImage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
}

