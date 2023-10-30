//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Tahir Atakan Can on 26.10.2023.
//

import UIKit
import CoreData

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
        
        // kullanıcı görsele tıklaması
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
        
        
        
    }
    
    
    @IBAction func saveButtonText(_ sender: Any){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        // Attributes
        
        newPainting.setValue(nameText.text, forKey: "name")
        newPainting.setValue(artistText.text, forKey: "artist")
        
        if let year = Int(yearText.text!){
            newPainting.setValue(year, forKey: "year")
        }
        
        newPainting.setValue(UUID(), forKey: "id")
        
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        newPainting.setValue(data, forKey: "image")
        
        // hata çıkabilir sadece bu şekil yazamam
        //context.save()
        
        do{
            try context.save()
            print("success")
        }catch {
            print("error")
        }
        
        
        
        
    }
    
    
    @objc func hideKeybord(){
        view.endEditing(true)
    }
    
    @objc func selectImage(){
        let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            //galeriye götürmek
        
            let alertController = UIAlertController(title: "Select", message: "Where do you want to choose the picture?", preferredStyle: .actionSheet)

            let galleryAction = UIAlertAction(title: "Photos", style: .default) { (action) in
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    imagePicker.sourceType = .photoLibrary
                    self.present(imagePicker, animated: true, completion: nil)
                } else {
                    // Galeri kullanılamaz uyarısı
                    
                }
            }

            let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    imagePicker.sourceType = .camera
                    self.present(imagePicker, animated: true, completion: nil)
                } else {
                    // Kamera kullanılamaz uyarısı
                    
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
