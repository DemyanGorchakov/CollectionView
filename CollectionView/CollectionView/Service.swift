//
//  Service.swift
//  CollectionView
//
//  Created by Демьян Горчаков on 15.01.2023.
//

import Foundation

class Service {
    
    func getImage(completion: @escaping ([Model]) -> ()) {
        let allImages: [Model] = [Model(images: "images"),
                                  Model(images: "images1"),
                                  Model(images: "images9"),
                                  Model(images: "images3"),
                                  Model(images: "images4"),
                                  Model(images: "images5"),
                                  Model(images: "images6"),
                                  Model(images: "images7"),
                                  Model(images: "images8"),
                                  Model(images: "images2")
        ]
        completion(allImages)
    }
}
