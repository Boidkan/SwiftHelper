//
//  UIViewExtension.swift
//  SwiftHelper
//
//  Created by Eric Collom on 2/5/16.
//  Copyright © 2016 Eric Collom. All rights reserved.
//

import UIKit

extension UIView{
    
    //ANIMATION 
    func fadeOut(vc:UIViewController,delay:NSTimeInterval,duration:NSTimeInterval){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(duration)
        UIView.setAnimationDelay(delay)
        UIView.setAnimationDelegate(vc)
        self.alpha = 0
        UIView.commitAnimations()
    }

    func fadeOut(vc:UIViewController,delay:NSTimeInterval,duration:NSTimeInterval,completionHandler:(()->Void)?){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(duration)
        UIView.setAnimationDelay(delay)
        UIView.setAnimationDelegate(vc)
        self.alpha = 0
        UIView.commitAnimations()
    }

    func fadeIn(vc:UIViewController,delay:NSTimeInterval,duration:NSTimeInterval){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(duration)
        UIView.setAnimationDelay(delay)
        UIView.setAnimationDelegate(vc)
        self.alpha = 1
        UIView.commitAnimations()
    }

    func moveView(duration:NSTimeInterval,x:CGFloat,y:CGFloat){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(duration)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseOut)
        UIView.setAnimationBeginsFromCurrentState(true)
        let transform = CGAffineTransformMakeTranslation(x, y)
        self.transform = transform
        self.transform = transform
        self.transform = transform
        UIView.commitAnimations()
    }
    
    //UI
    func addGradientSublayer(topColor topColor:UIColor,bottomColor:UIColor,width:CGFloat,height:CGFloat){
        let gl = CAGradientLayer()
        gl.colors = [topColor.CGColor, bottomColor.CGColor] as [AnyObject]
        gl.frame = CGRectMake(0, 0, width, height)
        self.layer.insertSublayer(gl, atIndex: 0)
    }
    
    func roundLeftCorners(frame:CGRect,radius:CGSize){
        let headerMaskPath = UIBezierPath(roundedRect: frame, byRoundingCorners: [.TopLeft, .BottomLeft],
            cornerRadii: radius)
        let headerMaskLayer = CAShapeLayer()
        headerMaskLayer.path = headerMaskPath.CGPath
        self.layer.mask = headerMaskLayer
    }
    
    func roundRightCorners(frame:CGRect,radius:CGSize){
        let headerMaskPath = UIBezierPath(roundedRect: frame, byRoundingCorners: [.TopRight, .BottomRight],
            cornerRadii: radius)
        let headerMaskLayer = CAShapeLayer()
        headerMaskLayer.path = headerMaskPath.CGPath
        self.layer.mask = headerMaskLayer
    }
    
    func roundAllCorners(frame:CGRect,radius:CGSize){
        let headerMaskPath = UIBezierPath(roundedRect: frame, byRoundingCorners: [.TopLeft, .BottomLeft, .TopRight, .BottomRight],
            cornerRadii: radius)
        let headerMaskLayer = CAShapeLayer()
        headerMaskLayer.path = headerMaskPath.CGPath
        self.layer.mask = headerMaskLayer
    }
    
    func roundBotomLeftCorner(frame:CGRect,radius:CGSize){
        let headerMaskPath = UIBezierPath(roundedRect: frame, byRoundingCorners: .BottomLeft, cornerRadii: radius)
        let headerMaskLayer = CAShapeLayer()
        headerMaskLayer.path = headerMaskPath.CGPath
        self.layer.mask = headerMaskLayer
    }
    
    func roundBotomRightCorner(frame:CGRect,radius:CGSize){
        let headerMaskPath = UIBezierPath(roundedRect: frame, byRoundingCorners: .BottomRight, cornerRadii: radius)
        let headerMaskLayer = CAShapeLayer()
        headerMaskLayer.path = headerMaskPath.CGPath
        self.layer.mask = headerMaskLayer
    }
    
    func roundTopCorners(frame:CGRect,radius:CGSize){
        let headerMaskPath = UIBezierPath(roundedRect: frame, byRoundingCorners: [.TopLeft, .TopRight], cornerRadii: radius)
        let headerMaskLayer = CAShapeLayer()
        headerMaskLayer.path = headerMaskPath.CGPath
        self.layer.mask = headerMaskLayer
    }
    
    func roundSpecifiedCorners(frame:CGRect,radius:CGSize, corners:UIRectCorner){
        let headerMaskPath = UIBezierPath(roundedRect: frame, byRoundingCorners: corners, cornerRadii: radius)
        let headerMaskLayer = CAShapeLayer()
        headerMaskLayer.path = headerMaskPath.CGPath
        self.layer.mask = headerMaskLayer
    }
}