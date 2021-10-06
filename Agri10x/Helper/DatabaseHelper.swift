//
//  DatabaseHelper.swift
//  Agri10x
//
//  Created by Akash Kumar on 06/10/21.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper {
    
    static let sharedInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func saveData(object:[String:AnyObject]) {
//        guard let contextObject = context, let detailsObject = NSEntityDescription.insertNewObject(forEntityName: "Details", into: contextObject) as? Details else {
//            return
//        }
        let userDetail = NSEntityDescription.insertNewObject(forEntityName: "Details", into: context!) as! Details
            guard let id = object["id"] as? Int32 else {
                return userDetail.id = 0
            }
            userDetail.id = id
            guard let category = object["category"] as? String else {
                return userDetail.category = ""
            }
            userDetail.category = category
            guard let count = object["count"] as? Int32 else {
                return userDetail.count  = 0
            }
            userDetail.count = count
            guard let description = object["description"] as? String else {
                return userDetail.desc  = ""
            }
            userDetail.desc = description
            guard let image = object["image"] as? String else {
                return userDetail.image  = ""
            }
            userDetail.image = image
            guard let price = object["price"] as? Double else {
                return userDetail.price  = 0.0
            }
            userDetail.price = price
            guard let rate = object["rate"] as? Double else {
                return userDetail.count  = 0
            }
            userDetail.rate = rate
            do {
                try context?.save()
            } catch {
                print("data is not save")
            }
    }
    
    func getUserData() ->[Details]{
          var userDetails = [Details]()
          let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Details")
          do {
              userDetails = try context?.fetch(fetchRequest) as! [Details]
          }catch{
              print("cannot get the data")
          }
          return userDetails
      }
    
    func deleteData(index:Int)->[Details]{
        var userObject = getUserData()
        context?.delete(userObject[index])
        userObject.remove(at: index)
        do {
            try context?.save()
        }catch {
            print("cannot delete data")
        }
        return userObject
    }
}


