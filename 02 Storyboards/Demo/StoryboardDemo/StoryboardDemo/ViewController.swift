//
//  ViewController.swift
//  StoryboardDemo
//
//  Created by Jiri Dutkevic on 11/12/14.
//  Copyright (c) 2014 Jiri Dutkevic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenImage: UIImageView!
    @IBOutlet weak var redImage: UIImageView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let lb = UIButton.buttonWithType(UIButtonType.System) as UIButton
        lb.setTitle("Left Button", forState: UIControlState.Normal)
        lb.sizeToFit()
        lb.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(lb)
        self.leftButton = lb
        
        let c1 = NSLayoutConstraint(item: self.leftButton, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 8.0)
        self.view.addConstraint(c1)
        let c2 = NSLayoutConstraint(item: self.leftButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.greenImage, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 8.0)
        self.view.addConstraint(c2)
        
        let rb = UIButton.buttonWithType(UIButtonType.System) as UIButton
        rb.setTitle("Right Button", forState: UIControlState.Normal)
        rb.sizeToFit()
        rb.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(rb)
        self.rightButton = rb
        
        let dict = NSDictionary(objects: [self.redImage, self.rightButton], forKeys: ["redImage", "rightButton"])
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[rightButton]-|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: dict));
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[redImage]-[rightButton]", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: dict));
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

