//
//  MovieTableViewCell.swift
//  MyMovies
//
//  Created by Andry Pro on 25.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var filmYearLabel: UILabel!
    @IBOutlet weak var filmRatingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCellWith() {
        self.filmNameLabel?.text = "Name"
        self.filmYearLabel.text = "Year"
        self.filmRatingLabel.text = "Rating"
        self.filmImageView.image = UIImage.init(named: "no_image")
    }
}
