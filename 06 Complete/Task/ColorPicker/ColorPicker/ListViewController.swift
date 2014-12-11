//
//  ListViewController.swift
//  ColorPicker
//
//  Created by Jiri Dutkevic on 11/12/14.
//
//

import UIKit

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
    
    func refresh()
    {
        refreshControl?.beginRefreshing()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0))
        { [weak self] in
            var request = NSMutableURLRequest(URL: DataSource.dataUrl())
            var maybeResponse: NSURLResponse?
            var maybeError: NSError?
            var maybeData = NSURLConnection.sendSynchronousRequest(request, returningResponse: &maybeResponse, error: &maybeError)
            
            var success = false
            if let error = maybeError {
                println(error.description)
            } else if let data = maybeData {
                let c = DataSource.colorsFromJSON(data)
                if let d = c {
                    self?.colors = d
                    success = true
                }
            }
            
            dispatch_async(dispatch_get_main_queue())
            { [weak self] in
                self?.refreshControl?.endRefreshing()
                if success {
                    self?.tableView?.reloadData()
                } else {
                    let vc = UIAlertController(title: "Error", message: "Failed to download data", preferredStyle: UIAlertControllerStyle.Alert)
                    vc.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
                    self?.presentViewController(vc, animated: true, completion: nil)
                }
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
