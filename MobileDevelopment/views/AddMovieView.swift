//
//  AddMovieView.swift
//  MobileDevelopment
//
//  Created by Oleksandr Korenev on 22.11.2020.
//

import Foundation
import UIKit

class AddMovieView: UIView {
    let titleLabel = UILabel();
    let titleInput = UITextField();
    let yearLabel = UILabel();
    let yearInput = UITextField();
    let typeLabel = UILabel();
    let typeInput = UITextField();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        buildLayout();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
        buildLayout();
    }
    
    func buildLayout() {
        self.addSubview(titleLabel)
        self.addSubview(titleInput)
        self.addSubview(yearLabel)
        self.addSubview(yearInput)
        self.addSubview(typeLabel)
        self.addSubview(typeInput)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Title: "
        titleLabel.sizeToFit();
        titleLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true;
        titleLabel.topAnchor.constraint(
            equalTo: safeAreaLayoutGuide.topAnchor,
            constant: 80
        ).isActive = true;
        titleLabel.leftAnchor.constraint(
            equalTo: safeAreaLayoutGuide.leftAnchor,
            constant: 20
        ).isActive = true;
        
        titleInput.translatesAutoresizingMaskIntoConstraints = false
        titleInput.keyboardType = UIKeyboardType.default;
        titleInput.placeholder = "Awesome movie title";
        titleInput.sizeToFit();
        titleInput.widthAnchor.constraint(
            equalTo: safeAreaLayoutGuide.widthAnchor,
            constant: -150
        ).isActive = true;
        titleInput.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true;
        titleInput.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 20).isActive = true;
        
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.text = "Year: "
        yearLabel.sizeToFit()
        yearLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true;
        yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true;
        yearLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true;
        
        yearInput.translatesAutoresizingMaskIntoConstraints = false
        yearInput.keyboardType = UIKeyboardType.numberPad;
        yearInput.placeholder = "1970";
        yearInput.sizeToFit();
        yearInput.widthAnchor.constraint(equalTo: titleInput.widthAnchor).isActive = true;
        yearInput.topAnchor.constraint(equalTo: yearLabel.topAnchor).isActive = true;
        yearInput.leftAnchor.constraint(equalTo: titleInput.leftAnchor).isActive = true;
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.text = "Type: "
        typeLabel.sizeToFit()
        typeLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true;
        typeLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 20).isActive = true;
        typeLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true;
        
        typeInput.translatesAutoresizingMaskIntoConstraints = false
        typeInput.placeholder = "movie";
        typeInput.sizeToFit();
        typeInput.widthAnchor.constraint(equalTo: titleInput.widthAnchor).isActive = true;
        typeInput.topAnchor.constraint(equalTo: typeLabel.topAnchor).isActive = true;
        typeInput.leftAnchor.constraint(equalTo: titleInput.leftAnchor).isActive = true;
    }
    
    func getMovie() -> Movie {
        return Movie(
            title: titleInput.text ?? "",
            year: yearInput.text ?? "",
            imdbId: "",
            type: typeInput.text ?? "",
            poster: "",
            details: nil
        )
    }
}
