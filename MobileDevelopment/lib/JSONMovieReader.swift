//
//  JSONMovieReader.swift
//  MobileDevelopment
//
//  Created by Oleksandr Korenev on 21.11.2020.
//

import Foundation

class JSONMovieReader {
    var movies: [Movie];
    
    init() {
        self.movies = [Movie]();
    }
    
    func readMovies() {
        if let path = Bundle.main.path(forResource: "MoviesData/MoviesList", ofType: "txt") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let movies = jsonResult["Search"] as? [Dictionary<String, String>] {
                    self.movies.reserveCapacity(movies.count)
                    for movie in movies {
                        self.movies.append(
                            Movie(
                                title: movie["Title", default: "Unknown title"],
                                year: movie["Year", default: "XXXX"],
                                imdbId: movie["imdbID", default: "Unknown imdbID"],
                                type: movie["Type", default: "Unknown type"],
                                poster: movie["Poster", default: ""]
                            )
                        );
                    }
                }
            } catch {
                debugPrint("caught: \(error)")
            }
        }
    }
}
