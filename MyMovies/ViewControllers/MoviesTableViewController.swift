//
//  MoviesTableViewController.swift
//  MyMovies
//
//  Created by Andry Pro on 25.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
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
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        super.tabBarController?.title = "Movies"
        loadData(from: nextPage)
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if movies.count > 0 {
            return movies.count
        } else {
            TableViewHelper.EmptyMessage(message: "Erroooor!", viewController: self)
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.configCellWith(with: movie)
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
            print(error?.localizedDescription)
        }
    }
}
