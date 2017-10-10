//
//  FeedDescriptionUI.swift
//  SyneboTestProject
//
//  Created by Alexandr Kudlak on 10/10/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

extension FeedDescribingVC {

    func setupUI(){
        self.view.backgroundColor = .white
        
        let description = UILabel()
        description.text = itemDescription.components(separatedBy: "<div")[0]
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(description)
        description.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        description.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        description.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
    }
}
