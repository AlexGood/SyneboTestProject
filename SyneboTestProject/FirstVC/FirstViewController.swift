//
//  ViewController.swift
//  SyneboTestProject
//
//  Created by Alexandr Kudlak on 10/10/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    let date = UILabel()
    var timer = Timer()
    let emptyLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.scheduledTimerWithTimeInterval()
    }
    
    func scheduledTimerWithTimeInterval(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateDate), userInfo: nil, repeats: true)
    }
    
    @objc func updateDate(){
        date.text = getDate()
    }
    
    func getDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMMM-YYYY HH:mm"
        
        return dateFormatter.string(from: Date())
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let title = UserDefaults.standard.value(forKey: "selectedFeed") as? String{
            emptyLabel.text = title
        }
    }
}
