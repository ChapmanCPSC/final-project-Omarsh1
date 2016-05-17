//
//  NoteTakerViewController.swift
//  Nocus
//
//  Created by Omar Sherief on 5/16/16.
//  Copyright © 2016 Project(X). All rights reserved.
//

import UIKit

class NoteTakerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
