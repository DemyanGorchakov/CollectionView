//
//  ViewControllerImage.swift
//  CollectionView
//
//  Created by Демьян Горчаков on 15.01.2023.
//

import UIKit

class ViewControllerImage: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var viewImage: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = UIImage(named: viewImage)

    }


}
