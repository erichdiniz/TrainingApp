//
//  HPDataSource.swift
//  Vai Chover iOS
//
//  Created by Erich Diniz on 10/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import UIKit
//typealias CompletionHandler = (() -> Void)

class HPDetailsDataSource{
    var view: UIImageView!

    
    func wand() -> UIImage{
    let fileName = "/Users/erichdiniz/desktop/repositorio/vai chover ios/trainingapp/assets/wand.png"
    let image = UIImage(contentsOfFile: fileName)
        
        return image!
    }
}
