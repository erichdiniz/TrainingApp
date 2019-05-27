//
//  ViewController.swift
//  Vai Chover iOS
//
//  Created by Erich Diniz on 06/05/19.
//  Copyright © 2019 Erich Diniz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //the dependences necessaries for the class
    
    @IBOutlet weak var tableView: UITableView!
    //the data that will be used
    let source = CharListDataSource(object: [])
    //where the data is coming from
    let service = SmashService()
    //
    
    @IBOutlet weak var SmashBar: UITabBarItem!
    lazy var viewModel = SmashViewModel(service: service, source: source)
    
    // data saource
    // service
    // viewmodel
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        //the datasource from the table view will be filled with the data source that came from the api
        tableView.dataSource = source
        //it will register the smashCell, which will activate the observer 
        tableView.register(UINib(nibName: "SmashViewCell", bundle: Bundle.main), forCellReuseIdentifier: "smashCell")
        source.addObserver(self) {
            //the method addObserver will call itself, and while it does that, the tableview will reload its data
            self.tableView.reloadData()
        }
        //
        viewModel.fetchChars()
    }
    
    
}

