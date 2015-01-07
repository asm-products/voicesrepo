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
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageCountLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 2
        messageCountLabel.layer.cornerRadius = messageCountLabel.bounds.width / 2
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
    }
        
}
