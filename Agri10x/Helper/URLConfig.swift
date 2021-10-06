//
//  URLConfig.swift
//  Agri10x
//
//  Created by Akash Kumar on 06/10/21.
//

import Foundation
struct URLConfig {
    static func getURLString(forKey key:String) -> String {
        var appConfigDataStore : NSDictionary!
        if(appConfigDataStore == nil) {
            let path = Bundle.main.path(forResource: "URLConfig", ofType: "plist")
            appConfigDataStore  =  NSDictionary(contentsOfFile: path!)!
        }
        guard let value = appConfigDataStore[key] as? String else {
            fatalError("Could not find value for key \(key) in the URLConfiguration.plist")
        }
        return value
    }
}
