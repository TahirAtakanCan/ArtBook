//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Tahir Atakan Can on 26.10.2023.
//

import UIKit

class DetailsVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var artistText: UITextField!
    
    @IBOutlet weak var yearText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        
        
        
        
        //Recognizer      klavye kapatma
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeybord))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
        
        
        
    }
    
    
    @IBAction func saveButtonText(_ sender: Any){
        
    }
    
    
    @objc func hideKeybord(){
        view.endEditing(true)
    }
    
    @objc func selectImage(){
        let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true

            let alertController = UIAlertController(title: "Select", message: "Where do you want to choose the picture?", preferredStyle: .actionSheet)

            let galleryAction = UIAlertAction(title: "Photos", style: .default) { (action) in
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    imagePicker.sourceType = .photoLibrary
                    self.present(imagePicker, animated: true, completion: nil)
                } else {
                    // Galeri kullanılamaz uyarısı
                    // Örneğin: self.showAlert(message: "Galeri kullanılamıyor.")
                }
            }

            let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    imagePicker.sourceType = .camera
                    self.present(imagePicker, animated: true, completion: nil)
                } else {
                    // Kamera kullanılamaz uyarısı
                    // Örneğin: self.showAlert(message: "Kamera kullanılamıyor.")
                }
            }

            let cancelAction = UIAlertAction(title: "Exit", style: .cancel, handler: nil)

            alertController.addAction(galleryAction)
            alertController.addAction(cameraAction)
            alertController.addAction(cancelAction)

            present(alertController, animated: true, completion: nil)
        
    }
    
    // medya ile işimiz bittiğinde bir şeyler döndürmek için
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage  //opsiyonel olarak
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
