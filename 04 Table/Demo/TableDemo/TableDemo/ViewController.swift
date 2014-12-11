//
//  ViewController.swift
//  TableDemo
//
//  Created by Jiri Dutkevic on 11/12/14.
//  Copyright (c) 2014 Jiri Dutkevic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var data: String? {
        didSet
        {
            updateLabel()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabel()
    {
        if (isViewLoaded()) {
            self.titleLabel.text = data
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
