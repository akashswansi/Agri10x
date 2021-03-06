//
//  DisplayDataInteractor.swift
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

protocol DisplayDataBusinessLogic
{
  func doSomething(request: DisplayData.Something.Request)
    func callDetailsApi(urlString:String?)
}

protocol DisplayDataDataStore
{
  //var name: String { get set }
}

class DisplayDataInteractor: DisplayDataBusinessLogic, DisplayDataDataStore
{
  var presenter: DisplayDataPresentationLogic?
  var worker: DisplayDataWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: DisplayData.Something.Request)
  {
    worker = DisplayDataWorker()
    worker?.doSomeWork()
    
    let response = DisplayData.Something.Response()
    presenter?.presentSomething(response: response)
  }
    func callDetailsApi(urlString:String?) {
        worker = DisplayDataWorker()
        worker?.callDetailsApi(urlString: urlString, compilerHandler: { (response, error) in
            self.presenter?.presentDetailsData(response: response)
        })
        //worker?.callDetailsApi(
    }
}
