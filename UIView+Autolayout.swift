//
//  UIView+Autolayout.swift
//  Raizlabs
//
//  Created by alex.rouse on 11/2/14.
//  Copyright (c) 2014 Raizlabs. All rights reserved.
//

import UIKit

extension UIView {
    
// MARK: Leading Space
    public func rzal_pinLeadingSpaceToSuperview(padding: CGFloat) -> NSLayoutConstraint {
        return self.rzal_pinLeadingSpaceToSuperview(padding, relation: NSLayoutRelation.Equal)
    }
    public func rzal_pinLeadingSpaceToSuperview(padding: CGFloat, relation: NSLayoutRelation) -> NSLayoutConstraint {
        assert(self.superview != nil, "View requires a superview to add constraints");
        var constraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Left,
            relatedBy: relation,
            toItem: self.superview,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1.0,
            constant: padding)
        return constraint;
    }
    public func rzal_pinLeadingSpaceToView(view: UIView, padding: CGFloat) -> NSLayoutConstraint {
        var constraint:NSLayoutConstraint = NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1.0,
            constant: padding)
        return constraint;
    }
    
// MARK: Trailing Space
    public func rzal_pinTrailingSpaceToSuperview(padding: CGFloat) -> NSLayoutConstraint {
        return self.rzal_pinTrailingSpaceToSuperview(padding, relation: NSLayoutRelation.Equal)
    }
    public func rzal_pinTrailingSpaceToSuperview(padding: CGFloat, relation: NSLayoutRelation) -> NSLayoutConstraint {
        assert(self.superview != nil, "View requires a superview to add constraints");
        var constraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Right,
            relatedBy: relation,
            toItem: self.superview,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1.0,
            constant: -padding)
        return constraint;
    }
    public func rzal_pinTrailingSpaceToView(view: UIView, padding: CGFloat) -> NSLayoutConstraint {
        var constraint:NSLayoutConstraint = NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1.0,
            constant: padding)
        return constraint;
    }
    
// MARK: Top Space
    public func rzal_pinTopSpaceToSuperview(padding: CGFloat) -> NSLayoutConstraint {
        return self.rzal_pinTopSpaceToSuperview(padding, relation: NSLayoutRelation.Equal)
    }
    public func rzal_pinTopSpaceToSuperview(padding: CGFloat, relation: NSLayoutRelation) -> NSLayoutConstraint {
        assert(self.superview != nil, "View requires a superview to add constraints");
        var constraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Top,
            relatedBy: relation,
            toItem: self.superview,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: padding)
        return constraint;
    }
    public func rzal_pinTopSpaceToView(view: UIView, space: CGFloat) -> NSLayoutConstraint {
        var constraint:NSLayoutConstraint = NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: space)
        return constraint;
    }

// MARK: Bottom Space
    public func rzal_pinBottomSpaceToSuperview(padding: CGFloat) -> NSLayoutConstraint {
        return self.rzal_pinBottomSpaceToSuperview(padding, relation: NSLayoutRelation.Equal)
    }
    public func rzal_pinBottomSpaceToSuperview(padding: CGFloat, relation: NSLayoutRelation) -> NSLayoutConstraint {

        assert(self.superview != nil, "View requires a superview to add constraints");
        var constraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: relation,
            toItem: self.superview,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: -padding)
        return constraint;
    }
    public func rzal_pinBottomSpaceToView(view: UIView, padding: CGFloat) -> NSLayoutConstraint {
        var constraint:NSLayoutConstraint = NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: padding)
        return constraint;
    }
    
// MARK: Size Constraints
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
    
    public func rzal_pinWidth(width: CGFloat) -> NSLayoutConstraint {
        var constraint:NSLayoutConstraint = NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: width)
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
    
    public func rzal_centerHorizontallyInContainerWithOffset(offset: CGFloat) -> NSLayoutConstraint {
        var constraint:NSLayoutConstraint = NSLayoutConstraint(
            item: self,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: offset)
        return constraint;
    }
    
    
    public func rzal_fillContainer(insets: UIEdgeInsets) -> NSArray {
        return self.rzal_fillContainer(insets, activate:false)
    }
    
    public func rzal_fillContainer(insets: UIEdgeInsets, activate: Bool) -> NSArray {
        assert(self.superview != nil, "View requires a superview to add constraints");
        var constraints:NSArray = [
            self.rzal_pinLeadingSpaceToSuperview(insets.left),
            self.rzal_pinTopSpaceToSuperview(insets.top),
            self.rzal_pinTrailingSpaceToSuperview(insets.right),
            self.rzal_pinBottomSpaceToSuperview(insets.bottom)
        ]
        for c:NSLayoutConstraint in constraints as [NSLayoutConstraint] {
            c.active = true
        }
        return constraints
    }
}
