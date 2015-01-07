//
//  ContactsCollectionViewController.swift
//  Voices
//
//  Created by Mazyad Alabduljaleel on 11/15/14.
//  Copyright (c) 2014 Assembly. All rights reserved.
//

import UIKit
import IBDesignables

class ContactsCollectionViewController: UICollectionViewController {

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ContactsCell.className, forIndexPath: indexPath) as UICollectionViewCell
    
        return cell
    }

}
