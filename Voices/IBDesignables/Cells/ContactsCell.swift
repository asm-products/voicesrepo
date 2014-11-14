//
//  ContactsCell.swift
//  Voices
//
//  Created by Mazyad Alabduljaleel on 11/15/14.
//  Copyright (c) 2014 Assembly. All rights reserved.
//

import UIKit

public class ContactsCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
    }
    
}
