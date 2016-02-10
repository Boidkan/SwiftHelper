//
//  AuxilaryMethods.swift
//  SwiftHelper
//
//  Created by Eric Collom on 2/10/16.
//  Copyright © 2016 Eric Collom. All rights reserved.
//

import Foundation


func measureWidthForText(text:NSString?,font:UIFont)->CGFloat{
    if text != nil{
        let tmpLabel = UILabel()
        tmpLabel.font = font
        tmpLabel.text = text as String!
        let size = tmpLabel.intrinsicContentSize().width
        return size
    }
    return 0
}

func measureHeightForText(text:String,font:UIFont)->CGFloat{
    let tmpLabel = UILabel()
    tmpLabel.font = font
    tmpLabel.text = text as String
    let size = tmpLabel.intrinsicContentSize().height
    return size
}

func requiredHeightForLabelWith(width:CGFloat, font:UIFont, text:String) -> CGFloat{
    let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.ByWordWrapping
    label.font = font
    label.text = text
    label.sizeToFit()
    return label.frame.height
}

func maxFontSizeForLabel(text:String,labelWidth:CGFloat,labelHeight:CGFloat,var font:UIFont)->CGFloat{
    var fontSize = font.pointSize
    var currentHeight = requiredHeightForLabelWith(labelWidth, font: font, text: text)
    while currentHeight >= labelHeight{
        fontSize = fontSize - 1
        font = font.fontWithSize(fontSize)
        currentHeight = requiredHeightForLabelWith(labelWidth, font: font, text: text)
    }
    return fontSize
}