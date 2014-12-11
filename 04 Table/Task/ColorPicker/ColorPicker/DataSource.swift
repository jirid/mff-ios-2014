//
//  DataSource.swift
//  ColorPicker
//
//  Created by Jiri Dutkevic on 11/12/14.
//
//

import Foundation
import UIKit

class DataSource: NSObject
{
    class func dataUrl() -> NSURL
    {
        return NSURL(string: "https://dl.dropboxusercontent.com/u/3758672/mff/resources/data.json")!
    }
    
    class func oneColor() -> Color
    {
        let i = UIImage(named: "blue")!
        let c = Color(n: "Blue", r: 0, g: 0, b: 255, i: i)
        return c
    }
    
    class func someColors() -> [Color]
    {
        var colors = [Color]()
        
        var i = UIImage(named: "red")!
        colors.append(Color(n: "Red", r: 255, g: 0, b: 0, i: i))
        
        i = UIImage(named: "green")!
        colors.append(Color(n: "Green", r: 0, g: 255, b: 0, i: i))
        
        i = UIImage(named: "blue")!
        colors.append(Color(n: "Blue", r: 0, g: 0, b: 255, i: i))
        
        i = UIImage(named: "yellow")!
        colors.append(Color(n: "Yellow", r: 255, g: 255, b: 0, i: i))
        
        i = UIImage(named: "teal")!
        colors.append(Color(n: "Teal", r: 0, g: 255, b: 255, i: i))
        
        i = UIImage(named: "purple")!
        colors.append(Color(n: "Purple", r: 255, g: 0, b: 255, i: i))
        
        return colors
    }
    
    class func colorFromJSON(json: NSDictionary) -> Color?
    {
        return Color(n: json["name"]! as String, r: (json["red"]! as NSNumber).unsignedCharValue, g: (json["green"]! as NSNumber).unsignedCharValue, b: (json["blue"]! as NSNumber).unsignedCharValue, u: NSURL(string: json["imageUrl"]! as String)!)
    }
    
    class func colorsFromJSON(json: NSData) -> [Color]?
    {
        var colors: [Color]? = nil
        
        var maybeError: NSError?
        var maybeParsed: AnyObject? = NSJSONSerialization.JSONObjectWithData(json, options: NSJSONReadingOptions.allZeros, error: &maybeError)
        
        if let error = maybeError {
            println(error.description)
        } else if let parsed: AnyObject = maybeParsed {
            if let list = parsed as? NSArray {
                colors = [Color]()
                for item in list {
                    if let dict = item as? NSDictionary {
                        if let color = colorFromJSON(dict) {
                            colors!.append(color)
                        }
                    }
                }
            }
        }
        
        return colors
    }
}
