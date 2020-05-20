//
//  SerialsTableViewController.swift
//  MyMovies
//
//  Created by Andry Pro on 25.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import UIKit

class SerialsTableViewController: UITableViewController {
    
    // MARK: - Private Properties
    private var movies = [Result]()
    private let dataManager = DataManager()
    private var nextPage = 1
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.rowHeight = 100
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.tabBarController?.title = "Serials"
        loadData(from: nextPage)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        cell.configCellWith(with: movies[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var curentPage = 1
        curentPage = Int(ceil(Double(indexPath.row / 20)) + 1)
        nextPage = curentPage + 1
        print( indexPath.row, curentPage, nextPage)
        
        if indexPath.row == (movies.count - 1) {
            let spinner = UIActivityIndicatorView(style: .medium)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(144))
            loadData(from: nextPage)
            self.tableView.tableFooterView = spinner
            self.tableView.tableFooterView?.isHidden = false
        }
    }
    
    // MARK: - Private Methods
    private func loadData(from page: Int) {
        dataManager.getMovies(with: page, succes: { [weak self] (results) in
            DispatchQueue.main.async {
                self?.movies = results
                
                self?.tableView.reloadData()
            }
        }) { (error) in
            print(error)
        }
    }
}
