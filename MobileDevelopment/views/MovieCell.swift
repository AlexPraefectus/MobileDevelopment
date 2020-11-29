//
//  MovieCell.swift
//  MobileDevelopment
//
//  Created by Oleksandr Korenev on 29.11.2020.
//

import Foundation
import UIKit


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
