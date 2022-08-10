//
//  DetailViewController.swift
//  TableList
//
//  Created by Arkadijs Makarenko on 10/08/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    var song: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if song != nil {
            trackImageView.image = UIImage(named: song?.cover ?? "Rammstein - rammstein")
            trackNameLabel.text = song?.track ?? "Rammstein - rammstein" + "\(song?.album ?? "Rammstein - rammstein")"
        }
    }
    


}
