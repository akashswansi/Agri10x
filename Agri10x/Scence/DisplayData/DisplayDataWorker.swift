//
//  DisplayDataWorker.swift
//  Agri10x
//
//  Created by Akash Kumar on 06/10/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class DisplayDataWorker
{
  func doSomeWork()
  {
  }
    func callDetailsApi(urlString:String?,compilerHandler: @escaping([UserDetails]?, Error?)->()) {
        guard let urlStr = urlString, urlStr != "",let url = URL(string: urlStr)  else {
            return
        }
        URLSession.shared.dataTask(with: url) {(data, response, error)
            in
            if error != nil {
                compilerHandler(nil,error)
            } else {
                guard  let dataDetails = data else {
                    return
                }
                do  {
                    let response = try JSONDecoder().decode([UserDetails].self, from: dataDetails)
                    guard response.count > 0 else {
                        return
                    }
                    compilerHandler(response,nil)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
