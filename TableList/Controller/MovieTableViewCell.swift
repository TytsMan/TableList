//
//  MovieTableViewCell.swift
//  TableList
//
//  Created by Arkadijs Makarenko on 10/08/2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(_ movie: Movie) {
        coverImage.image = UIImage(named: movie.cover)
        titleLabel.text = movie.title
        yearLabel.text = "\(movie.releaseYear)"
        genreLabel.text = movie.genre
    }

}

extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
