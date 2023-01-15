//
//  ViewController.swift
//  CollectionView
//
//  Created by Демьян Горчаков on 15.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    let service = Service()
    var image = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "All photos"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setCollectionView()
        
        service.getImage { image in
            self.image = image
            self.collectionView.reloadData()
        }
    }
    
    func setCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(UINib(nibName: CollectionViewCell.reuseId, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.reuseId)
        
        
        self.view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue",
           let destination = segue.destination as? ViewControllerImage,
           let index = collectionView.indexPathsForSelectedItems?.first {
            destination.viewImage = image[index.row].images
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue", sender: self)
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let image = image[indexPath.row].images
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId, for: indexPath) as? CollectionViewCell {
            cell.setupImage(image)
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/3)
    }
    
}
