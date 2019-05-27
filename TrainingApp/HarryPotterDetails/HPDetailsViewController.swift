//
//  HPDetailsViewController.swift
//  TrainingApp
//
//  Created by Erich Diniz on 14/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import UIKit
import CoreData

class HPDetailsViewController: UIViewController{
    
    
    @IBOutlet weak var wandImage: UIImageView!

    @IBOutlet weak var charLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    
    @IBOutlet weak var charImage: UIImageView!
    
    @IBOutlet weak var actorButton: UIButton!
    @IBOutlet weak var ancestralLabel: UILabel!
    //    @IBOutlet weak var charImage: UIImageView!
    
    var image: UIImage?
    var nameText: String?
    var houseText: String?
    var birthText: String?
    var actorText: String!
    var ancestralText: String?
    var source: HPDetailsDataSource?
    var actorTextReplaced: Any?
//    var charImag: UIImageView!
    

    override func viewDidLoad()
    {
        print(actorText as Any)
        super.viewDidLoad()
        self.charLabel.text = nameText
        self.charImage.image = image
        self.houseLabel.text = houseText ?? "None"
        self.birthLabel.text = birthText ?? "None"
        self.ancestralLabel.text = ancestralText ?? "None"
        self.actorButton.setTitle(actorText, for: .normal)
        
        var replaced: Any?{
            return actorText.replacingOccurrences(of: " ", with: "_")
        }
        
        actorTextReplaced = replaced
        print(actorTextReplaced ?? "Erro ")
//        wandImage.image = source?.wand()

    }
    
    func buttonTap(){
    guard let url = URL(string: "https://en.wikipedia.org/wiki/\(actorTextReplaced ?? "Erro")") else { return }
//    UIApplication.shared.open(url)
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func actorButton(_ sender: UIButton) {
        buttonTap()
    }
    

    @IBAction func saveBtClicked(_ sender: Any) {
        
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let ent = NSEntityDescription.entity(forEntityName:"Chars" , in: context)
        
        var newChar = Chars(entity: ent!, insertInto: context)
        
        newChar.nameData = nameText!
//        newChar.imageData = image
//        newChar.dateOfBirthData = birthText!
//        newChar.houseData = houseText!
//        newChar.ancestryData = ancestralText!
        
        do {
            try context.save()
            print(newChar)
            print("Object Saved")
        } catch {
            print("Failed saving")
        }
    }
    
        
    
    
    
}
