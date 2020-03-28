//
//  MainTabBarController.swift
//  MyMovies
//
//  Created by Andry Pro on 25.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    var moviesViewController: MoviesTableViewController?
    var serialsViewController: SerialsTableViewController?
    var favoritesViewController: FavoriteTableViewController?
    
    var subviewControllers = [UITableViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupTabBar()
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func setupTabBar() {
        moviesViewController = MoviesTableViewController()
        serialsViewController = SerialsTableViewController()
        favoritesViewController = FavoriteTableViewController()
        
        subviewControllers.append(moviesViewController!)
        subviewControllers.append(serialsViewController!)
        subviewControllers.append(favoritesViewController!)
        
        moviesViewController?.tabBarItem = UITabBarItem(title: "Movies", image: UIImage.init(named: "film"), selectedImage: UIImage.init(named: "film_black"))
        moviesViewController?.tabBarItem.tag = 0
        serialsViewController?.tabBarItem = UITabBarItem(title: "Serials", image: UIImage.init(named: "serial"), selectedImage: UIImage.init(named: "serial_black"))
        serialsViewController?.tabBarItem.tag = 1
        favoritesViewController?.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage.init(named: "star"), selectedImage: UIImage.init(named: "star_black"))
        favoritesViewController?.tabBarItem.tag = 2
        
        let tabBarItemApperance = UITabBarItem.appearance()
        
        tabBarItemApperance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
        
        self.setViewControllers(subviewControllers, animated: true)
        self.selectedIndex = 0
        self.selectedViewController = moviesViewController
    }
    
    
    
}
