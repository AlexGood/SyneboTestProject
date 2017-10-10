//
//  SecondTableViewDelegate.swift
//  SyneboTestProject
//
//  Created by Alexandr Kudlak on 10/10/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseId, for: indexPath as IndexPath)
        
        cell.textLabel?.text = self.tableData[indexPath.row].title
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let profileVC = FeedDescribingVC()
        profileVC.itemDescription = self.tableData[indexPath.row].description!
        UserDefaults.standard.setValue(self.tableData[indexPath.row].title!, forKey: "selectedFeed")
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
}
