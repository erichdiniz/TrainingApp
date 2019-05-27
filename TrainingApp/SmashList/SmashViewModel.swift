//
//  SmashModelView.swift
//  Vai Chover iOS
//
//  Created by Erich Diniz on 09/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import UIKit

class SmashViewModel{
    
    // the data and their loation are called
    
    private var serviceSmash: SmashService
    private var sourceSmash: CharListDataSource
   //and initialized when the viewModel is called
    init(service: SmashService, source: CharListDataSource ){
        serviceSmash = service
        sourceSmash = source
    }
    
    
    //takes the chars from the API
    func fetchChars(){
        serviceSmash.SmashAPI(completion: { chars, errorMessage in
            DispatchQueue.main.async {
                self.sourceSmash.charObjects = [chars ?? []]
            }
        
        })
    }
}
