//
//  ColorDetailViewController.swift
//  ColorPicker
//
//  Created by Jiri Dutkevic on 11/12/14.
//
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    var color = DataSource.oneColor()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = color.name
        redLabel.text = "\(color.red)"
        greenLabel.text = "\(color.green)"
        blueLabel.text = "\(color.blue)"
        imageView.image = color.image
    }
}