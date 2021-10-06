//
//  SwipeProtocols.swift
//  Agri10x
//
//  Created by Akash Kumar on 06/10/21.
//

import Foundation
import Foundation
import UIKit

protocol SwipeCardsDataSource {
    func numberOfCardsToShow() -> Int
    func card(at index: Int) -> SwipesView
    func emptyView() -> UIView?
    
}

protocol SwipeCardsDelegate {
    func swipeDidEnd(on view: SwipesView)
}
