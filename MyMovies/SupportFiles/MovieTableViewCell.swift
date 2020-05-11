//
//  MovieTableViewCell.swift
//  MyMovies
//
//  Created by Andry Pro on 25.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Private Properties
    @IBOutlet private weak var filmImageView: UIImageView!
    @IBOutlet private weak var filmNameLabel: UILabel!
    @IBOutlet private weak var filmYearLabel: UILabel!
    @IBOutlet private weak var filmRatingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        // обнулять картинку
    }
    
    func configCellWith(with movie: Result) {
        self.filmNameLabel.text = movie.originalTitle
        self.filmYearLabel.text = movie.releaseDate
        self.filmRatingLabel.text = String(movie.popularity)
        self.filmImageView.image = UIImage.init(named: "no_image")
        DispatchQueue.global().async {
            let stringURL = "https://image.tmdb.org/t/p/w500/" + movie.posterPath
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                self.filmImageView.image = UIImage(data: imageData)
            }
        }
    }
}
