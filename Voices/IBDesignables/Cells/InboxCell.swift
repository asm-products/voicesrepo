//
//  InboxCell.swift
//  Voices
//
//  Created by Mazyad Alabduljaleel on 11/15/14.
//  Copyright (c) 2014 Assembly. All rights reserved.
//

import UIKit

@IBDesignable
public class InboxCell: UICollectionViewCell {
    
    public class var height: CGFloat {
        return 74
    }
    
    @IBOutlet var messageCountLabel: UILabel?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        messageCountLabel!.layer.cornerRadius = messageCountLabel!.bounds.width / 2
    }
        
}
