//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Tahir Atakan Can on 26.10.2023.
//

import UIKit

class DetailsVC: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var artistText: UITextField!
    
    @IBOutlet weak var yearText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gestureRecognizer = UITapGestureRecognizer
    }
    
    
    @IBAction func saveButtonText(_ sender: Any) {
    }
    
    
}
