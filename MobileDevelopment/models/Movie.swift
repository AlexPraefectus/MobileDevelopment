//
//  Movie.swift
//  MobileDevelopment
//
//  Created by Oleksandr Korenev on 21.11.2020.
//

import Foundation

class Movie {
    var title: String
    var year: String
    var imdbId: String
    var type: String
    var poster: String
    
    init(title: String, year: String, imdbId: String, type: String, poster: String) {
        self.title = title;
        self.year = year;
        self.imdbId = imdbId;
        self.type = type;
        self.poster = poster;
    }
}
