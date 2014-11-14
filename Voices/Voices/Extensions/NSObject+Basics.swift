//
//  NSObject+Basics.swift
//  LocalPrayApp-ios
//
//  Created by Mazyad Alabduljaleel on 11/9/14.
//  Copyright (c) 2014 ArabianDevs. All rights reserved.
//

import Foundation

extension NSObject {
    
    class var className: String {
        var classString = NSStringFromClass(self)
        let range = classString.rangeOfString(".", options: .CaseInsensitiveSearch, range: Range<String.Index>(start:classString.startIndex, end: classString.endIndex), locale: nil)
        
        var identifier = ""
        if let dotRange = range {
            identifier = classString.substringFromIndex(dotRange.endIndex)
        }
        else {
            assertionFailure("Couldn't resolve class: \(classString)")
        }
        
        return identifier
    }
    
}

