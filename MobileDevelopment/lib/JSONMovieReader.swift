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
                                poster: movie["Poster", default: ""],
                                details: self.readDetails(imdbId: movie["imdbID", default: ""])
                            )
                        );
                    }
                }
            } catch {
                debugPrint("caught: \(error)")
            }
        }
    }
    
    func readDetails(imdbId: String) -> MovieDetails? {
        let resource = "MoviesData/Extra/" + imdbId;
        if let path = Bundle.main.path(forResource: resource, ofType: "txt") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe);
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let details = jsonResult as? Dictionary<String, String> {
                    return MovieDetails(
                        title: details["Title", default: "No title"],
                        year: details["Year", default: "No year"],
                        rated: details["Rated", default: "No rating"],
                        released: details["Released", default: "Unknown date"],
                        runtime: details["Runtime", default: "Unknown"],
                        genre: details["Genre", default: "Unknown"],
                        director: details["Director", default: "Unknown"],
                        writer: details["Writer", default: "Unknown"],
                        actors: details["Actors", default: "Unknown"],
                        plot: details["Plot", default: "Unknown"],
                        language: details["Language", default: "Unknown"],
                        country: details["Country", default: "Unknown"],
                        awards: details["Awards", default: "Unknown"],
                        poster: details["Poster", default: ""],
                        imdbRating: details["imdbRating", default: ""],
                        imdbVotes: details["imdbVotes", default: ""],
                        imdbID: details["imdbID", default: ""],
                        type: details["Type", default: ""],
                        production: details["Production", default: "Unknown"]
                    )
                }
            } catch {
                debugPrint("caught: \(error)")
            }
        }
        return nil;
    }
}
