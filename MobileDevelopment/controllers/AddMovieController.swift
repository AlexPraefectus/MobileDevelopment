//
//  AddMovieController.swift
//  MobileDevelopment
//
//  Created by Oleksandr Korenev on 22.11.2020.
//

import Foundation
import UIKit

class AddMovieController: UIViewController {
    var movieToSave: Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let view = self.view as! AddMovieView;
        if segue.identifier == "doneSegue" {
            movieToSave = view.getMovie()
        }
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        if identifier == "doneSegue" {
            let view = self.view as! AddMovieView;
            let movie = view.getMovie();
            if movie.title.count == 0 || movie.year.count == 0 || movie.type.count == 0 {
                Toast.show(message: "Please fill all fields", controller: self);
                return false;
            }
            if movie.year.count != 4 {
                Toast.show(message: "Year should consist of 4 numbers", controller: self)
                return false;
            }
        }
        return true;
    }
}
