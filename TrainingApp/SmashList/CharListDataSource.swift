//
//  CharListDataSource.swift
//  Vai Chover iOS
//
//  Created by Erich Diniz on 09/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import UIKit
//CompletionHandler will have the the value of void????
typealias CompletionHandler = (() -> Void)

class CharListDataSource: NSObject, UITableViewDataSource {
    //Every time the Object gets used, this variable will be notified
    var charObjects: [[SmashChars]] {
        didSet{
            self.Notify()
        }
    }
    //observer
    var observers: CompletionHandler?
    
    //set that every time the datasource gets used, it will retrieve the objerct and set them as the variable with the notification
    init(object: [[SmashChars]]){
        self.charObjects = object
        
        
    }
    //function that make the param observer
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler){
        observers = completionHandler
    }
    
    //método usado pra notificar os observers, que não sera obrigatorio haver dados(?).
    public func Notify(){
        observers?()
    }
    
    //realiza a contagem de sessoes dos objetos
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charObjects[section].count
    }
    
    //tells what sort of cells eagh row shall have
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //if the identifier smashCell gets registered, it will return properly, and the dequeueReusableCell takes care of that
        //dont call it until registered
        let cell = tableView.dequeueReusableCell(withIdentifier: "smashCell", for: indexPath) as! SmashViewCell
        let char = charObjects[indexPath.section][indexPath.row]
        
        //the text from the labels will recieve the itens from the object, each row have its own itens, based on the indexpath
        cell.id.text = char.id
        cell.name.text = char.name
        cell.tier.text = char.tierdata
        cell.fallspeed.text = char.fallspeed
        
        
        return cell
    }
    
    //the number of sections will have the same amount of the quanntity of objects on the list
    func numberOfSections(in tableView: UITableView) -> Int {
        return charObjects.count
    }
    
}


