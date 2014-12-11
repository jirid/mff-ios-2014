//
//  ViewController.swift
//  NetworkDemo
//
//  Created by Jiri Dutkevic on 12/12/14.
//  Copyright (c) 2014 Jiri Dutkevic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        downloadDataOperationQueue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downloadDataGCD()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0))
        {
            let request = NSURLRequest(URL: NSURL(string: "http://www.mff.cuni.cz/")!)
            var maybeResponse: NSURLResponse?
            var maybeError: NSError?
            let data: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse: &maybeResponse, error: &maybeError)
            if let error = maybeError {
                println(error.localizedDescription)
            } else if let response = maybeResponse {
                if let httpResponse = response as? NSHTTPURLResponse {
                    if (httpResponse.statusCode == 200) {
                        let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
                        dispatch_async(dispatch_get_main_queue())
                            {
                                println(str)
                        }
                    } else {
                        println("Server returned response code: \(httpResponse.statusCode)")
                    }
                } else {
                    println("unknown error")
                }
            } else {
                println("unknown error")
            }
        }
    }

    let queue = NSOperationQueue()

    func downloadDataOperationQueue()
    {
        queue.addOperationWithBlock()
        {
            let request = NSURLRequest(URL: NSURL(string: "http://www.mff.cuni.cz/")!)
            var maybeResponse: NSURLResponse?
            var maybeError: NSError?
            let data: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse: &maybeResponse, error: &maybeError)
            if let error = maybeError {
                println(error.localizedDescription)
            } else if let response = maybeResponse {
                if let httpResponse = response as? NSHTTPURLResponse {
                    if (httpResponse.statusCode == 200) {
                        let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
                        NSOperationQueue.mainQueue().addOperationWithBlock()
                        {
                             println(str)
                        }
                    } else {
                        println("Server returned response code: \(httpResponse.statusCode)")
                    }
                } else {
                    println("unknown error")
                }
            } else {
                println("unknown error")
            }
        }
    }
}

