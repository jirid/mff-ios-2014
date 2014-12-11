//
//  ColorDetailViewController.swift
//  ColorPicker
//
//  Created by Jiri Dutkevic on 11/12/14.
//
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    var color: Color? {
        didSet {
            updateView()
        }
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    func updateView()
    {
        if (isViewLoaded()) {
            if let c = color {
                titleLabel.text = c.name
                redLabel.text = "\(c.red)"
                greenLabel.text = "\(c.green)"
                blueLabel.text = "\(c.blue)"
                imageView.image = c.image
            }
        }
    }
}