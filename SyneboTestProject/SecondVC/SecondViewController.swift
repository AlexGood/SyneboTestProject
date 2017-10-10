//
//  SecondViewController.swift
//  SyneboTestProject
//
//  Created by Alexandr Kudlak on 10/10/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit
import FeedKit
import SVProgressHUD

class SecondViewController: UIViewController {

    let segmentedControl = UISegmentedControl()
    let tableView = UITableView()
    let reuseId = "cell"
    var tableData = [RSSFeedItem]()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.getData(url: "\(AppConstants.api)/reuters/businessNews") { (data, error) in
            if data != nil{
                self.tableData = data!
            } else if let error = error {
                let _ = SimpleAlert.showAlert(alert: error, delegate: self)
            }
            self.reloadTableView()
        }
        self.scheduledTimerWithTimeInterval()
    }
    
    func scheduledTimerWithTimeInterval(){
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.reloadAllRSS), userInfo: nil, repeats: true)
    }
    
    func getData(url: String, completionHandler: @escaping ([RSSFeedItem]?,String?) -> Void) -> Void {

        let feedURL = URL(string: url)!
        let parser = FeedParser(URL: feedURL)
        
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show()
        
        parser?.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
            let result = parser?.parse()
            
            guard let feed = result?.rssFeed, (result?.isSuccess)! else {
                completionHandler(nil, String(describing: result?.error))
                return
            }
            
            completionHandler(feed.items!, nil)
        }
    }
    
    @objc func changeTableViewData(sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            self.getData(url: "\(AppConstants.api)/reuters/businessNews") { (data, error) in
                if data != nil{
                    self.tableData = data!
                } else if let error = error {
                    let _ = SimpleAlert.showAlert(alert: error, delegate: self)
                }
                self.reloadTableView()
            }
        } else {
            self.getData(url: "\(AppConstants.api)/reuters/entertainment") { (data, error) in
                if data != nil{
                    self.tableData = data!
                } else if let error = error {
                    let _ = SimpleAlert.showAlert(alert: error, delegate: self)
                }
                self.reloadTableView()
            }
            self.getData(url: "\(AppConstants.api)/reuters/environment") { (data, error) in
                if data != nil{
                    self.reloadTableView()
                    self.tableData += data!
                } else if let error = error {
                    let _ = SimpleAlert.showAlert(alert: error, delegate: self)
                }
                self.reloadTableView()
            }
        }
    }
    
    func reloadTableView(){
        OperationQueue.main.addOperation {
            SVProgressHUD.setDefaultMaskType(.none)
            SVProgressHUD.dismiss()
            self.tableView.reloadData()
        }
    }
    
    @objc func reloadAllRSS(){
        self.getData(url: "\(AppConstants.api)/reuters/businessNews") { (data, error) in
            if data != nil{
                self.tableData = data!
            } else if let error = error {
                let _ = SimpleAlert.showAlert(alert: error, delegate: self)
            }
            self.reloadTableView()
        }
        self.getData(url: "\(AppConstants.api)/reuters/entertainment") { (data, error) in
            if data != nil{
                self.tableData = data!
            } else if let error = error {
                let _ = SimpleAlert.showAlert(alert: error, delegate: self)
            }
            self.reloadTableView()
        }
        self.getData(url: "\(AppConstants.api)/reuters/environment") { (data, error) in
            if data != nil{
                self.reloadTableView()
                self.tableData += data!
            } else if let error = error {
                let _ = SimpleAlert.showAlert(alert: error, delegate: self)
            }
            self.reloadTableView()
        }
    }
}
