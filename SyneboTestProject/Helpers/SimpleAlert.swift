//
//  SimpleAlert.swift
//  SyneboTestProject
//
//  Created by Alexandr Kudlak on 10/10/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import Foundation
import UIKit

class SimpleAlert {
    static func showAlert(alert: String, delegate: UIViewController) -> UIAlertController {
        let alertController = UIAlertController(title: "", message: alert, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
        delegate.present(alertController, animated: true, completion: nil)
        return alertController
    }
}

