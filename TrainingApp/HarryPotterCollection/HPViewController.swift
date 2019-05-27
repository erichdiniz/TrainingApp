//
//  ViewController.swift
//  Vai Chover iOS
//
//  Created by Erich Diniz on 06/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import UIKit

class HPViewController: UIViewController {
    
    
    //the dependences necessaries for the class
    @IBOutlet weak var collecView: UICollectionView!
    let source = HPDataSource(object: [])
    var selectedCell = 0
    let service = HPService()
    
    lazy var viewModel = HPViewModel(service: service, source: source)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        collecView.delegate = self as? UICollectionViewDelegate
        collecView.dataSource = source
        collecView.register(UINib(nibName: "HPCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "HPCell")
        source.addObserver(self) {
            
            self.collecView.reloadData()
        }
        
        viewModel.fetchHP()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? HPDetailsViewController {
            vc.nameText = source.charObjects[selectedCell].name
            vc.houseText = source.charObjects[selectedCell].house
            vc.birthText = source.charObjects[selectedCell].dateOfBirth
            vc.actorText = source.charObjects[selectedCell].actor!
            vc.ancestralText = source.charObjects[selectedCell].ancestry
            if let url = URL(string: source.charObjects[selectedCell].image!){
                do{
                    let imageData = try Data(contentsOf: url)
                    vc.image = UIImage(data: imageData)
//                    vc.image.layer.shouldRasterize = true
//                    vc.image.layer.rasterizationScale = UIScreen.main.scale
                }
                catch let error{
                    print("Erro \(error.localizedDescription)")
                }
            }
        }
    }
    
}

extension HPViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
        
    {
        selectedCell = indexPath.row
        self.performSegue(withIdentifier: "hpDetails", sender: self)
        
    }
}
