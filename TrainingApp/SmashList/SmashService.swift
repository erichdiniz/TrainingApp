//
//  SmashService.swift
//  Vai Chover iOS
//
//  Created by Erich Diniz on 09/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import UIKit

class SmashService {
    
    init(){
        
    }
    
    //URL endpoint
    let url = URL(string: "http://smashlounge.com/api/chars/all")!
    //create the session object
    let session = URLSession.shared
    //? = optional, if does not have any data, it`ll return Nil (null)
    func SmashAPI(completion: @escaping (_ chars: [SmashChars]?, _ errorMessage: String?) -> Void){
        
        let request = URLRequest(url: url)
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(nil, "error")
                return
            }
            
            guard let data = data else {
                completion(nil, "data error")
                return
            }
            //in case it does not produce any sort of erros, the JSON decoder will take the data from the object and print it
            do {
                //create decodable object from data
                let decodedObject = try JSONDecoder().decode([SmashChars].self, from: data)
                print(decodedObject)
                //the completion handler will recieve the decodedObject
                completion(decodedObject, nil)
            } catch let error {
                completion(nil, "error")
                print(error.localizedDescription)
            }
        })
        
        task.resume()
    }
}
