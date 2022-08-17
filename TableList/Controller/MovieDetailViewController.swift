//
//  MovieDetailViewController.swift
//  TableList
//
//  Created by ivan.dekhtiarov on 17/08/2022.
//

import UIKit
import WebKit

class MovieDetailViewController: UIViewController {
    
    // MARK: - State
    
    enum MovieDetailState {
        case browsingDetail
        case watchingTrailer
    }
    
    // MARK: - Properties
    
    private var state: MovieDetailState = .browsingDetail {
        didSet {
            handleCurrentState(state)
        }
    }
    
    var movie: Movie?
    
    // MARK: - Outlets
    
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var trailerView: WKWebView!
    @IBOutlet private weak var watchTrailerButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        state = .browsingDetail
        if let movie = movie {
            updateUIElementsForMovie(movie)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func watchTrailerButtonTapped(_ sender: Any) {
        if state == .browsingDetail {
            state = .watchingTrailer
        } else if state == .watchingTrailer {
            state = .browsingDetail
        }
    }
    
    // MARK: - Setup
    
//    private func setup(_ movie: Movie) {
//        self.movie = movie
//        state = .browsingDetail
//    }
    
    private func updateUIElementsForMovie(_ movie: Movie) {
        title = movie.title
        coverImageView.image = UIImage(named: movie.cover)
        yearLabel.text = "Realease: \(movie.releaseYear)"
        genreLabel.text = "Genre: \(movie.genre)"
        descriptionLabel.text = movie.desctription
        setupWebView(with: movie.trailerUrl)
    }
    
    private func setupWebView(with url: String) {
        let url = URL(string: url)!
        let request = URLRequest(url: url)
        trailerView.load(request)
    }
    
    // MARK: - Logic
    
    private func handleCurrentState(_ state: MovieDetailState) {
        switch state {
        case .browsingDetail:
            stopWatchingTrailer()
        case .watchingTrailer:
            startWatchingTrailer()
        }
    }
    
    private func startWatchingTrailer() {
        coverImageView.isHidden = true
        yearLabel.isHidden = true
        genreLabel.isHidden = true
        descriptionLabel.isHidden = true
        trailerView.isHidden = false
        watchTrailerButton.setTitle("Stop watching", for: .normal)
    }
    
    private func stopWatchingTrailer() {
        coverImageView.isHidden = false
        yearLabel.isHidden = false
        genreLabel.isHidden = false
        descriptionLabel.isHidden = false
        trailerView.isHidden = true
        watchTrailerButton.setTitle("Watch the trailer", for: .normal)
    }
}
