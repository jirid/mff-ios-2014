//
//  ColorDetailViewController.swift
//  ColorPicker
//
//  Created by Jiri Dutkevic on 11/12/14.
//
//

import UIKit
import ColorShared

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
                displayImage(c)
            }
        }
    }
    
    func displayImage(c: Color)
    {
        if let img = c.image {
            imageView.image = img
        } else if let url = c.imageUrl {
            downloadImage(url, c)
        } else {
            imageView.image = nil
        }
    }
    
    let queue = NSOperationQueue()
    
    func downloadImage(url: NSURL, _ c: Color)
    {
        DataSource.downloadImage(queue, url: url)
        { [weak self] image in
            if let i = image {
                c.setImage(i)
                self?.imageView.image = i
            }
        }
    }
}