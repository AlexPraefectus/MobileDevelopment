//
//  MovieDetailsView.swift
//  MobileDevelopment
//
//  Created by Oleksandr Korenev on 28.11.2020.
//

import Foundation
import UIKit

func getMultilineLabel(text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false;
    label.text = text;
    label.sizeToFit();
    label.numberOfLines = 0;
    label.lineBreakMode = .byWordWrapping;
    return label;
}

class MovieDetailsView: UIScrollView {
    var details: MovieDetails? = nil;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    func setDetails(d: MovieDetails) {
        details = d;
        buildLayout()
    }
    
    func buildLayout() {
        let d: MovieDetails = details!;
        
        let title = getMultilineLabel(text: d.title)
        title.textAlignment = .center;
        self.addSubview(title);
        title.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true;
        title.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true;
        title.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true;
        title.widthAnchor.constraint(equalTo: widthAnchor, constant: -80).isActive = true;
        
        let poster = UIImageView(image: UIImage(named: "MoviesData/Posters/" + d.poster));
        poster.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(poster)
        poster.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true;
        poster.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true;
        poster.leftAnchor.constraint(greaterThanOrEqualTo: title.leftAnchor).isActive = true;
        poster.rightAnchor.constraint(lessThanOrEqualTo: title.rightAnchor).isActive = true;
        poster.widthAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true;
        poster.heightAnchor.constraint(lessThanOrEqualToConstant: 468).isActive = true;
        
        let released = getMultilineLabel(text: "Released: " + d.released);
        self.addSubview(released);
        released.topAnchor.constraint(equalTo: poster.bottomAnchor, constant: 40).isActive = true;
        released.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true;
        released.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true;
        released.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true;
        
        let rated = getMultilineLabel(text: "Rated: " + d.rated);
        self.addSubview(rated);
        rated.topAnchor.constraint(equalTo: released.bottomAnchor).isActive = true;
        rated.leftAnchor.constraint(equalTo: released.leftAnchor).isActive = true;
        rated.rightAnchor.constraint(equalTo: released.rightAnchor).isActive = true;
        rated.widthAnchor.constraint(equalTo: released.widthAnchor).isActive = true;
        
        let runtime = getMultilineLabel(text: "Runtime: " + d.runtime);
        self.addSubview(runtime);
        runtime.topAnchor.constraint(equalTo: rated.bottomAnchor).isActive = true;
        runtime.leftAnchor.constraint(equalTo: released.leftAnchor).isActive = true;
        runtime.rightAnchor.constraint(equalTo: released.rightAnchor).isActive = true;
        runtime.widthAnchor.constraint(equalTo: released.widthAnchor).isActive = true;
        
        let genre = getMultilineLabel(text: "Genre: " + d.genre);
        self.addSubview(genre);
        genre.topAnchor.constraint(equalTo: runtime.bottomAnchor).isActive = true;
        genre.leftAnchor.constraint(equalTo: released.leftAnchor).isActive = true;
        genre.rightAnchor.constraint(equalTo: released.rightAnchor).isActive = true;
        genre.widthAnchor.constraint(equalTo: released.widthAnchor).isActive = true;
        
        let country = getMultilineLabel(text: "Country: " + d.country);
        self.addSubview(country);
        country.topAnchor.constraint(equalTo: genre.bottomAnchor).isActive = true;
        country.leftAnchor.constraint(equalTo: released.leftAnchor).isActive = true;
        country.rightAnchor.constraint(equalTo: released.rightAnchor).isActive = true;
        country.widthAnchor.constraint(equalTo: released.widthAnchor).isActive = true;
        
        let language = getMultilineLabel(text: "Language: " + d.language);
        self.addSubview(language);
        language.topAnchor.constraint(equalTo: country.bottomAnchor).isActive = true;
        language.leftAnchor.constraint(equalTo: released.leftAnchor).isActive = true;
        language.rightAnchor.constraint(equalTo: released.rightAnchor).isActive = true;
        language.widthAnchor.constraint(equalTo: released.widthAnchor).isActive = true;
        
        let type = getMultilineLabel(text: "Type: " + d.type);
        self.addSubview(type);
        type.topAnchor.constraint(equalTo: language.bottomAnchor).isActive = true;
        type.leftAnchor.constraint(equalTo: released.leftAnchor).isActive = true;
        type.rightAnchor.constraint(equalTo: released.rightAnchor).isActive = true;
        type.widthAnchor.constraint(equalTo: released.widthAnchor).isActive = true;
        
        let plot = getMultilineLabel(text: "Plot:\n" + d.plot);
        self.addSubview(plot);
        plot.topAnchor.constraint(equalTo: type.bottomAnchor, constant: 15).isActive = true;
        plot.leftAnchor.constraint(equalTo: released.leftAnchor).isActive = true;
        plot.rightAnchor.constraint(equalTo: released.rightAnchor).isActive = true;
        plot.widthAnchor.constraint(equalTo: released.widthAnchor).isActive = true;
        
        let director = getMultilineLabel(text: "Director: " + d.director);
        self.addSubview(director);
        director.topAnchor.constraint(equalTo: plot.bottomAnchor, constant: 15).isActive = true;
        director.leftAnchor.constraint(equalTo: released.leftAnchor).isActive = true;
        director.rightAnchor.constraint(equalTo: released.rightAnchor).isActive = true;
        director.widthAnchor.constraint(equalTo: released.widthAnchor).isActive = true;
        
        let writer = getMultilineLabel(text: "Writer: " + d.writer);
        self.addSubview(writer);
        writer.topAnchor.constraint(equalTo: director.bottomAnchor).isActive = true;
        writer.leftAnchor.constraint(equalTo: released.leftAnchor).isActive = true;
        writer.rightAnchor.constraint(equalTo: released.rightAnchor).isActive = true;
        writer.widthAnchor.constraint(equalTo: released.widthAnchor).isActive = true;
        
        let prod = getMultilineLabel(text: "Production: " + d.production);
        self.addSubview(prod);
        prod.topAnchor.constraint(equalTo: writer.bottomAnchor).isActive = true;
        prod.leftAnchor.constraint(equalTo: released.leftAnchor).isActive = true;
        prod.rightAnchor.constraint(equalTo: released.rightAnchor).isActive = true;
        prod.widthAnchor.constraint(equalTo: released.widthAnchor).isActive = true;
        
        let actors = getMultilineLabel(text: "Actors: " + d.actors);
        self.addSubview(actors);
        actors.topAnchor.constraint(equalTo: prod.bottomAnchor).isActive = true;
        actors.leftAnchor.constraint(equalTo: released.leftAnchor).isActive = true;
        actors.rightAnchor.constraint(equalTo: released.rightAnchor).isActive = true;
        actors.widthAnchor.constraint(equalTo: released.widthAnchor).isActive = true;
        
        let awards = getMultilineLabel(text: "Awards: " + d.awards);
        self.addSubview(awards);
        awards.topAnchor.constraint(equalTo: actors.bottomAnchor).isActive = true;
        awards.leftAnchor.constraint(equalTo: released.leftAnchor).isActive = true;
        awards.rightAnchor.constraint(equalTo: released.rightAnchor).isActive = true;
        awards.widthAnchor.constraint(equalTo: released.widthAnchor).isActive = true;
        
        let iid = getMultilineLabel(text: "imdb ID: " + d.imdbID);
        self.addSubview(iid);
        iid.topAnchor.constraint(equalTo: awards.bottomAnchor, constant: 20).isActive = true;
        iid.leftAnchor.constraint(equalTo: released.leftAnchor).isActive = true;
        iid.rightAnchor.constraint(equalTo: released.rightAnchor).isActive = true;
        iid.widthAnchor.constraint(equalTo: released.widthAnchor).isActive = true;
        
        let ivotes = getMultilineLabel(text: "imdb Votes: " + d.imdbVotes);
        self.addSubview(ivotes);
        ivotes.topAnchor.constraint(equalTo: iid.bottomAnchor).isActive = true;
        ivotes.leftAnchor.constraint(equalTo: released.leftAnchor).isActive = true;
        ivotes.rightAnchor.constraint(equalTo: released.rightAnchor).isActive = true;
        ivotes.widthAnchor.constraint(equalTo: released.widthAnchor).isActive = true;
        
        let irating = getMultilineLabel(text: "imdb Rating: " + d.imdbRating);
        self.addSubview(irating);
        irating.topAnchor.constraint(equalTo: ivotes.bottomAnchor).isActive = true;
        irating.leftAnchor.constraint(equalTo: released.leftAnchor).isActive = true;
        irating.rightAnchor.constraint(equalTo: released.rightAnchor).isActive = true;
        irating.widthAnchor.constraint(equalTo: released.widthAnchor).isActive = true;
        
        topAnchor.constraint(equalTo: title.topAnchor).isActive = true;
        bottomAnchor.constraint(equalTo: irating.bottomAnchor).isActive = true;
    }
    
}
