//
//  StoryBoardHelper.swift
//  Agri10x
//
//  Created by Akash Kumar on 06/10/21.
//

import Foundation
import UIKit


/// Storyboard identifiers
enum AppClass: String {
    /// Storyboard instance for FavouriteVC
    case FavouriteVC = "FavouriteViewController"
}

/// Enum for Storyboard
enum StoryBoard: String {
    /// FavouriteVC
    case Favourite
    /// Storyboard instance
    var board: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}
