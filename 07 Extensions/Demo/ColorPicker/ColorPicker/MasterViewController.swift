//
//  MasterViewController.swift
//  ColorPicker
//
//  Created by Jiri Dutkevic on 11/12/14.
//
//

import UIKit
import ColorShared

class MasterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.barTintColor = UIColor.grayColor()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction
    func colorSelected(segue: UIStoryboardSegue) {
        let detail = segue.sourceViewController as ColorDetailViewController
        if let color = detail.color {
            let r = CGFloat(color.red) / 255.0
            let g = CGFloat(color.green) / 255.0
            let b = CGFloat(color.blue) / 255.0
            let c = UIColor(red: r, green: g, blue: b, alpha: 0.9);
            self.navigationController!.navigationBar.barTintColor = c
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
