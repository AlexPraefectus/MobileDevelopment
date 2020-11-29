//
//  ViewController.swift
//  MobileDevelopment
//
//  Created by Alexandr Korenev on 20.09.2020.
//

import UIKit

class TableViewController: UITableViewController {
    var movies: [Movie] = [];
    let cellId = "cellId";

    override func viewDidLoad() {
        super.viewDidLoad()
        self.movies = self.loadData();
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.register(MovieCell.self, forCellReuseIdentifier: cellId);
        tableView.estimatedRowHeight = 250;
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieCell;
        cell.setMovie(movie: movies[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            movies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    func loadData () -> [Movie]{
        let reader = JSONMovieReader();
        reader.readMovies();
        return reader.movies;
    }
    
    @IBAction func done(segue:UIStoryboardSegue) {
        let addMovieVC = segue.source as! AddMovieController;
        movies.append(addMovieVC.movieToSave!);
        tableView.reloadData();
    }
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
        navigationController?.popViewController(animated: true);
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.row]
        
        if (selectedMovie.details == nil) {
            let alert = UIAlertController(
                title: "Not found",
                message: "No details available for the selected movie",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            tableView.deselectRow(at: indexPath, animated: true);
        }
        
        if #available(iOS 13.0, *) {
            if let vc = storyboard?.instantiateViewController(identifier: "movieDetailVC")
                as? MovieDetailsViewController {
                vc.movieDetails = selectedMovie.details;
                self.present(vc, animated: true, completion: nil)
            }
        } else {
            let vc = MovieDetailsViewController()
            vc.movieDetails = selectedMovie.details;
            self.present(vc, animated: true, completion: nil)
        }

    }
}
