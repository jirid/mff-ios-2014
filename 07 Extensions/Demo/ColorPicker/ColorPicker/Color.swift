//
//  Color.swift
//  ColorPicker
//
//  Created by Jiri Dutkevic on 11/12/14.
//
//

import UIKit

class Color: NSObject
{
    
    let name: String
    let red: UInt8
    let green: UInt8
    let blue: UInt8
    private var _image: UIImage?
    var image: UIImage? {
        get
        {
            return _image
        }
    }
    let imageUrl: NSURL?
    
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
    
    convenience init(n: String, r: UInt8, g: UInt8, b: UInt8, u: NSURL)
    {
        self.init(n, r, g, b, nil, u)
    }
    
    convenience init(n: String, r: UInt8, g: UInt8, b: UInt8, i: UIImage)
    {
        self.init(n, r, g, b, i, nil)
    }
    
    func setImage(i: UIImage)
    {
        _image = i;
    }
}
