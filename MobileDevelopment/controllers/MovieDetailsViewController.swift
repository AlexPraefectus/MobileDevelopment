//
//  MovieDetailsViewController.swift
//  MobileDevelopment
//
//  Created by Oleksandr Korenev on 28.11.2020.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    var movieDetails: MovieDetails? = nil
    
    override func viewDidLoad() {
        let view = self.view as? MovieDetailsView;
        view?.setDetails(d: movieDetails!)
    }
}
