//
//  SmashService.swift
//  Vai Chover iOS
//
//  Created by Erich Diniz on 09/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import UIKit
//API KEY $2a$10$YeriYlI2X6misOz5RpUDxuphRSdwXy/ZNh0PzTpLGamw/IDg9fAvO


class HPService {
    
    init(){
        
    }
    
    //URL endpoint
    let url = URL(string: "http://hp-api.herokuapp.com/api/characters")!
    //create the session object
    let session = URLSession.shared
    //? = optional, if does not have any data, it`ll return Nil (null)
    func HPAPI(completion: @escaping (_ chars: [HPChars]?, _ errorMessage: String?) -> Void){
        
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
                let decodedObject = try JSONDecoder().decode([HPChars].self, from: data)
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

enum Result <T>{
    case Success(T)
    case Error(String)
}
