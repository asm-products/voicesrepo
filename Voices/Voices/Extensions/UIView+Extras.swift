//
//  UICollectionViewCell+Extras.swift
//  LocalPrayApp-ios
//
//  Created by Mazyad Alabduljaleel on 11/2/14.
//  Copyright (c) 2014 ArabianDevs. All rights reserved.
//

import UIKit

private var dummyInstance: AnyObject? = nil

extension UIView {
        
    class func nib() -> UINib {
        return UINib(nibName: className, bundle: nil)
    }
    
    class func dummy() -> AnyObject {
        
        if let instance: AnyObject = dummyInstance {
            return instance
        }
        
        let objects = nib().instantiateWithOwner(nil, options: nil)
        assert(objects.count == 1, "Unexpected number of objects in nib")
        
        dummyInstance = objects[0]
        
        return objects[0]
    }
    
}
