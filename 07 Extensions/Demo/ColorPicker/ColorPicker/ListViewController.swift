//
//  ListViewController.swift
//  ColorPicker
//
//  Created by Jiri Dutkevic on 11/12/14.
//
//

import UIKit
import ColorShared

class ListViewController: UITableViewController {
    
    var colors: [Color]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.barTintColor = UIColor.grayColor()
        
        self.refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    let queue = NSOperationQueue()
    
    func refresh()
    {
        refreshControl?.beginRefreshing()
        DataSource.downloadColors(queue)
        { [weak self] colors in
            self?.refreshControl?.endRefreshing()
            if let c = colors {
                self?.colors = colors
                self?.tableView?.reloadData()
            } else {
                let vc = UIAlertController(title: "Error", message: "Failed to download data", preferredStyle: UIAlertControllerStyle.Alert)
                vc.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
                self?.presentViewController(vc, animated: true, completion: nil)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return colors == nil ? 0 : colors!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel!.text = colors![indexPath.row].name
        cell.accessoryType = .DisclosureIndicator

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ShowDetail", sender: colors![indexPath.row])
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        let vc = segue.destinationViewController as ColorDetailViewController
        vc.color = sender as? Color
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

}
