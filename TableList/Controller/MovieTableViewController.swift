//
//  MovieTableViewController.swift
//  TableList
//
//  Created by Arkadijs Makarenko on 10/08/2022.
//

import UIKit

class MovieTableViewController: UITableViewController {

    let movies: [Movie] = DataManager.shared.createMovies()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Movies"
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieTableViewCell.reuseIdentifier
        ) as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        cell.update(movie)
        
        return cell
    }

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movieDetailVC = segue.destination as? MovieDetailViewController,
         let selectedRowIdx = tableView.indexPathForSelectedRow?.row {
            let movie = movies[selectedRowIdx]
            movieDetailVC.movie = movie
        }
    }

}
