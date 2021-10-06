//
//  GlobalUtility.swift
//  Agri10x
//
//  Created by Akash Kumar on 06/10/21.
//

import Foundation
import UIKit
@objc class GlobalUtility: NSObject {
    
    /// Shared instance of the globalutility class
    static let shared: GlobalUtility = {
        let instance = GlobalUtility()
        // setup code
        return instance
    }()
    
    /// Show Progress view in the app
    
    
    /// - ADD custom Font and colour
    class func customFontString(_ string: String, font:UIFont?, color:UIColor?) -> NSAttributedString {
        if font != nil && color != nil {
            let stringAttributes = [NSAttributedString.Key.font : font!, NSAttributedString.Key.foregroundColor: color!]
            let customString = NSAttributedString(string: string, attributes:stringAttributes)
            return customString
        }
        return NSAttributedString()
    }
    
   
}

