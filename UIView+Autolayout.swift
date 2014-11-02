//
//  UIView+Autolayout.swift
//  Raizlabs
//
//  Created by alex.rouse on 11/2/14.
//  Copyright (c) 2014 Raizlabs. All rights reserved.
//

import UIKit

extension UIView {
    
    public func rzal_pinLeadingSpaceToSuperview(padding: CGFloat) -> NSLayoutConstraint {
        assert(self.superview != nil, "View requires a superview to add constraints");
        var constraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1.0,
            constant: padding)
        return constraint;
    }
    
    public func rzal_pinTopSpaceToSuperview(padding: CGFloat) -> NSLayoutConstraint {
        assert(self.superview != nil, "View requires a superview to add constraints");
        var constraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: padding)
        return constraint;
    }
    
    public func rzal_pinTrailingSpaceToSuperview(padding: CGFloat) -> NSLayoutConstraint {
        assert(self.superview != nil, "View requires a superview to add constraints");
        var constraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1.0,
            constant: -padding)
        return constraint;
    }
    
    public func rzal_pinBottomSpaceToSuperview(padding: CGFloat) -> NSLayoutConstraint {
        assert(self.superview != nil, "View requires a superview to add constraints");
        var constraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: -padding)
        return constraint;
    }
    
    
    public func rzal_pinHeight(height: CGFloat) -> NSLayoutConstraint {
        var constraint:NSLayoutConstraint = NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: height)
        return constraint;
    }
    
    public func rzal_centerVerticallyInContainerWithOffset(offset: CGFloat) -> NSLayoutConstraint {
        var constraint:NSLayoutConstraint = NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1.0,
            constant: offset)
        return constraint;
    }
    
    public func rzal_fillContainer(insets: UIEdgeInsets) -> NSArray {
        assert(self.superview != nil, "View requires a superview to add constraints");
        var constraints:NSArray = [
            self.rzal_pinLeadingSpaceToSuperview(insets.left),
            self.rzal_pinTopSpaceToSuperview(insets.top),
            self.rzal_pinTrailingSpaceToSuperview(insets.right),
            self.rzal_pinBottomSpaceToSuperview(insets.bottom)
        ]
        return constraints
    }
}