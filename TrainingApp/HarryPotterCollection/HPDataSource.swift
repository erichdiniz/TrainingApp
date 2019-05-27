//
//  HPDataSource.swift
//  Vai Chover iOS
//
//  Created by Erich Diniz on 10/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import UIKit
//typealias CompletionHandler = (() -> Void)

class HPDataSource: NSObject, UICollectionViewDataSource{
    var imageGlobal: UIImageView!
    var charObjects: [HPChars]{
        didSet{
            self.Notify()
        }
    }
    public var observers: CompletionHandler?
    
    init(object: [HPChars]){
        self.charObjects = object
    }
    
    public func addObserver(_ observer:NSObject, completionHandler: @escaping CompletionHandler){
        observers = completionHandler
    }
    
    public func Notify(){
        observers?()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charObjects.count
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HPCell", for: indexPath) as! HPCollectionViewCell

        let char = charObjects[indexPath.row]
        
        cell.charLabel.text = char.name
        if let filePath = (char.image){
            
            cell.charImage.contentMode = .scaleAspectFit
            
            if let url = URL(string: filePath){
                do{
                    let imageData = try Data(contentsOf: url)
                    cell.charImage.image = UIImage(data: imageData)
                    cell.layer.shouldRasterize = true
                    cell.layer.rasterizationScale = UIScreen.main.scale
                }
                catch let error{
                    print("Erro \(error.localizedDescription)")
                }
                
            }
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}



