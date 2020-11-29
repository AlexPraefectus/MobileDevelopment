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
    let searchController = UISearchController(searchResultsController: nil)
    var filteredMovies: [Movie] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movies = self.loadData();
        // table related stuff
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.register(MovieCell.self, forCellReuseIdentifier: cellId);
        tableView.estimatedRowHeight = 250;
        // search related stuff
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Movies"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredMovies.count;
        }
        return movies.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieCell;
        cell.setMovie(movie: isFiltering ? filteredMovies[indexPath.row]: movies[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if isFiltering {
                let id = filteredMovies[indexPath.row].uuid;
                if let idx =  movies.firstIndex(where: {$0.uuid == id }) {
                    movies.remove(at: idx);
                }
                filteredMovies.remove(at: indexPath.row);
            } else {
                movies.remove(at: indexPath.row);
            }
            tableView.reloadData();
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
        let selectedMovie = isFiltering ? filteredMovies[indexPath.row]: movies[indexPath.row]
        
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
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredMovies = movies.filter { (movie: Movie) -> Bool in
            return movie.title.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
}

extension TableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
  }
}
