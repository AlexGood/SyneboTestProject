//
//  SecondUI.swift
//  SyneboTestProject
//
//  Created by Alexandr Kudlak on 10/10/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

extension SecondViewController {
    func setupUI(){
        self.view.backgroundColor = .white
        
        self.segmentedControl.insertSegment(withTitle: "First", at: 0, animated: false)
        self.segmentedControl.insertSegment(withTitle: "Second", at: 1, animated: false)
        self.segmentedControl.selectedSegmentIndex = 0
        self.segmentedControl.tintColor = .black
        self.segmentedControl.addTarget(self, action: #selector(changeTableViewData), for: .valueChanged)
        self.segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.segmentedControl)
        self.segmentedControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 62).isActive = true
        self.segmentedControl.widthAnchor.constraint(equalToConstant: AppConstants.screenWidth + 10).isActive = true
        self.segmentedControl.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: -5).isActive = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.reuseId)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        self.tableView.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}
