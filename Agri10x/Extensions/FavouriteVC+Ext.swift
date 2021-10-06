//
//  DisplayData+Ext.swift
//  Agri10x
//
//  Created by Akash Kumar on 06/10/21.
//

import Foundation
import UIKit

extension FavouriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard self.userData.count > 0 else {
            return 0
        }
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let tmp = tableView.dequeueReusableCell(withIdentifier: "DisplayDataTableViewCell") as? DisplayDataTableViewCell {
            tmp.configureCell(data: userData[indexPath.row])
            cell = tmp
        }
       // self.configureCell(cell, indexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            userData = DatabaseHelper.sharedInstance.deleteData(index: indexPath.row)
            userDeletedData = userData
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
}
