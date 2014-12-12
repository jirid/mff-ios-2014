//
//  Color.swift
//  ColorPicker
//
//  Created by Jiri Dutkevic on 11/12/14.
//
//

import UIKit

public class Color: NSObject
{
    
    public let name: String
    public let red: UInt8
    public let green: UInt8
    public let blue: UInt8
    private var _image: UIImage?
    public var image: UIImage? {
        get
        {
            return _image
        }
    }
    public let imageUrl: NSURL?
    
    private init(_ n: String, _ r: UInt8, _ g: UInt8, _ b: UInt8, _ i: UIImage?, _ u: NSURL?)
    {
        name = n
        red = r
        green = g
        blue = b
        _image = i
        imageUrl = u
        super.init()
    }
    
    public convenience init(n: String, r: UInt8, g: UInt8, b: UInt8, u: NSURL)
    {
        self.init(n, r, g, b, nil, u)
    }
    
    public convenience init(n: String, r: UInt8, g: UInt8, b: UInt8, i: UIImage)
    {
        self.init(n, r, g, b, i, nil)
    }
    
    public func setImage(i: UIImage)
    {
        _image = i;
    }
}
