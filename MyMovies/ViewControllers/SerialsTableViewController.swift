//
//  SerialsTableViewController.swift
//  MyMovies
//
//  Created by Andry Pro on 25.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import UIKit

class SerialsTableViewController: UITableViewController {
    
    
    var movies = [Result]()
    let dataManager = DataManager()
   
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.rowHeight = 100
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.tabBarController?.title = "Serials"
        self.movies = dataManager.getMovies()
       
    }

    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell

       return cell
    }
    
}
