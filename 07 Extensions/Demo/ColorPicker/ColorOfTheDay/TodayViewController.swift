//
//  TodayViewController.swift
//  ColorOfTheDay
//
//  Created by Jiri Dutkevic on 12/12/14.
//
//

import UIKit
import NotificationCenter
import ColorShared

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let queue = NSOperationQueue()
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        DataSource.downloadColors(queue)
        { [weak self] colors in
            if let c = colors {
                self?.titleLabel.text = colors![0].name
                completionHandler(NCUpdateResult.NewData)
            } else {
                completionHandler(NCUpdateResult.Failed)
            }
        }
    }
    
}
