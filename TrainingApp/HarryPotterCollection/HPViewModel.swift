//
//  HPViewModel.swift
//  Vai Chover iOS
//
//  Created by Erich Diniz on 10/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class HPViewModel{
    
    private var serviceHP: HPService
    var sourceHP: HPDataSource
    
    init(service: HPService, source: HPDataSource){
        serviceHP = service
        sourceHP = source
        
    }
    
    
    func fetchHP(){
        serviceHP.HPAPI(completion:{ chars, errorMessage in
            DispatchQueue.main.async {
                self.sourceHP.charObjects = chars ?? []
            }
        })
    }
    
    func getEntity(){
        
        sourceHP.charObjects.forEach {
            let char: Char = CoreDataStack.getEntity()
            char.nameData = $0.name
            char.imageData = $0.image
            char.actorData = $0.actor
            char.dateOfBirthData = $0.dateOfBirth
            char.houseData = $0.house
            char.ancestryData = $0.ancestry
            
            CoreDataStack.saveContext()
            
        }
        func fetchEntity(){
            
        }
        
    }
}
