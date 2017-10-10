//
//  FirstUI.swift
//  SyneboTestProject
//
//  Created by Alexandr Kudlak on 10/10/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

extension FirstViewController {
    func setupUI(){
        self.view.backgroundColor = .white
        
        let name = UILabel()
        name.text = "Alexander Kudlak"
        name.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(name)
        name.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive = true
        name.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        date.text = getDate()
        date.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(date)
        date.topAnchor.constraint(equalTo: name.topAnchor, constant: 50).isActive = true
        date.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyLabel.font = UIFont.systemFont(ofSize: 13)
        emptyLabel.numberOfLines = 0
        self.view.addSubview(emptyLabel)
        emptyLabel.topAnchor.constraint(equalTo: date.topAnchor, constant: 50).isActive = true
        emptyLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        emptyLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
    }
}
