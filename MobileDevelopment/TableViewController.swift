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

class CustomLabel: UILabel {
    override var text: String? {
        didSet {
            self.numberOfLines = 0;
            self.lineBreakMode = .byWordWrapping;
            self.sizeToFit();
        }
    }
}


class MovieCell: UITableViewCell {
    let posterView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 234))
    let titleView = CustomLabel()
    let yearView = CustomLabel()
    let imdbIdView = CustomLabel()
    let typeView = CustomLabel()
    
    func setMovie(movie: Movie) {
        posterView.image = UIImage(named: "MoviesData/Posters/" + movie.poster);
        posterView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                        constant: 20).isActive = true;
        posterView.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                         constant: 20).isActive = true;
        posterView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                           constant: -20).isActive = true;
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.text = "Title: " + movie.title;
        titleView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true;
        titleView.leftAnchor.constraint(equalTo: posterView.rightAnchor, constant: 10).isActive = true;
        titleView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -50).isActive = true;
        
        yearView.translatesAutoresizingMaskIntoConstraints = false
        yearView.text = "Year: " + movie.year;
        yearView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10).isActive = true;
        yearView.leftAnchor.constraint(equalTo: titleView.leftAnchor).isActive = true;
        yearView.rightAnchor.constraint(equalTo: titleView.rightAnchor).isActive = true;
        
        imdbIdView.translatesAutoresizingMaskIntoConstraints = false
        imdbIdView.text = "ImdbID: " + movie.imdbId;
        imdbIdView.topAnchor.constraint(equalTo: yearView.bottomAnchor).isActive = true;
        imdbIdView.leftAnchor.constraint(equalTo: titleView.leftAnchor).isActive = true;
        imdbIdView.rightAnchor.constraint(equalTo: titleView.rightAnchor).isActive = true;
        
        typeView.translatesAutoresizingMaskIntoConstraints = false
        typeView.text = "Type: " + movie.type;
        typeView.topAnchor.constraint(equalTo: imdbIdView.bottomAnchor).isActive = true;
        typeView.leftAnchor.constraint(equalTo: titleView.leftAnchor).isActive = true;
        typeView.rightAnchor.constraint(equalTo: titleView.rightAnchor).isActive = true;
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(posterView);
        contentView.addSubview(titleView)
        contentView.addSubview(yearView)
        contentView.addSubview(imdbIdView)
        contentView.addSubview(typeView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
