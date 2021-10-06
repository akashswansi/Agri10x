//
//  CustomLabel.swift
//  Agri10x
//
//  Created by Akash Kumar on 06/10/21.
//

import Foundation
import UIKit

@IBDesignable class RoundLabel: UILabel {
    
  func setup() {
          layer.cornerRadius = frame.height / 2
          clipsToBounds = true
      }
  override func awakeFromNib() {
          super.awakeFromNib()
          setup()
      }
  override func layoutSubviews() {
          super.layoutSubviews()
          setup()
      }
  override func prepareForInterfaceBuilder() {
          super.prepareForInterfaceBuilder()
          setup()
      }
  }
    

