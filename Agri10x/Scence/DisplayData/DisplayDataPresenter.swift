//
//  DisplayDataPresenter.swift
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

protocol DisplayDataPresentationLogic
{
  func presentSomething(response: DisplayData.Something.Response)
    func presentDetailsData(response:[UserDetails]?)
}

class DisplayDataPresenter: DisplayDataPresentationLogic
{
  weak var viewController: DisplayDataDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: DisplayData.Something.Response)
  {
    let viewModel = DisplayData.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
    func presentDetailsData(response:[UserDetails]?) {
        self.viewController?.didReceiveDetailsResponse(response: response)
    }
}
