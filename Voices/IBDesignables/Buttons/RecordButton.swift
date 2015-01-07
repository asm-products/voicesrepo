//
//  RecordButton.swift
//  Voices
//
//  Created by Mazyad Alabduljaleel on 11/14/14.
//  Copyright (c) 2014 Assembly. All rights reserved.
//

import UIKit

@IBDesignable
public class RecordButton: UIControl {
   
    enum RecordingState {
        case Idle
        case Recording
    }
    
    var recordingState: RecordingState = .Idle
    
    // MARK: - Private methods
    
    private func drawIdleState() {
        
        let inset = bounds.width / 3.5
        let rect = bounds.rectByInsetting(dx: inset, dy: inset)
        let recordIcon = UIBezierPath(ovalInRect: rect)
        UIColor.redColor().set()
        recordIcon.fill()
        
    }
    
    private func drawRecordingState() {
        
        let inset = bounds.width / 3.5
        let rect = bounds.rectByInsetting(dx: inset, dy: inset)
        let stopIcon = UIBezierPath(roundedRect: rect, cornerRadius: 2)
        UIColor.whiteColor().set()
        stopIcon.fill()
        
    }
    
    // MARK: - Protected methods
    
    public override func drawRect(rect: CGRect) {
        
        /* Draw outer circle */
        let outerCircle = UIBezierPath(ovalInRect: bounds)
        UIColor(white: 1.0, alpha: 0.5).set()
        outerCircle.fill()
        
        switch recordingState {
        case .Idle:
            drawIdleState()
        case .Recording:
            drawRecordingState()
        }
        
    }
    
}
