//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Демьян Горчаков on 15.01.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    static var reuseId = "CollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupImage(_ img: String) {
        self.imageView.image = UIImage(named: img)
    }
}
