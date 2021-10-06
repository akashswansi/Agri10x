//
//  FavouriteRouter.swift
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

@objc protocol FavouriteRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol FavouriteDataPassing
{
  var dataStore: FavouriteDataStore? { get }
}

class FavouriteRouter: NSObject, FavouriteRoutingLogic, FavouriteDataPassing
{
  weak var viewController: FavouriteViewController?
  var dataStore: FavouriteDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: FavouriteViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: FavouriteDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
