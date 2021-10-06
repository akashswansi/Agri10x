//
//  SwipeStackView.swift
//  Agri10x
//
//  Created by Akash Kumar on 06/10/21.
//

import Foundation
import UIKit

class SwipeStackView: UIView,SwipeCardsDelegate {
    var numberOfCardsToShow: Int = 0
       var cardsToBeVisible: Int = 3
       var cardViews : [SwipesView] = []
       var remainingcards: Int = 0
       
       let horizontalInset: CGFloat = 10.0
       let verticalInset: CGFloat = 10.0
       
       var visibleCards: [SwipesView] {
           return subviews as? [SwipesView] ?? []
       }
       var dataSource: SwipeCardsDataSource? {
           didSet {
               reloadData()
           }
       }
    
    override init(frame: CGRect) {
           super.init(frame: .zero)
           backgroundColor = .clear
           
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

    func reloadData() {
        removeAllCardViews()
        guard let datasource = dataSource else { return }
        setNeedsLayout()
        layoutIfNeeded()
        numberOfCardsToShow = datasource.numberOfCardsToShow()
        remainingcards = numberOfCardsToShow
        
        for i in 0..<min(numberOfCardsToShow,cardsToBeVisible) {
            addCardView(cardView: datasource.card(at: i), atIndex: i )
            
        }
    }
    
    private func addCardView(cardView: SwipesView, atIndex index: Int) {
           cardView.delegate = self
           addCardFrame(index: index, cardView: cardView)
           cardViews.append(cardView)
           insertSubview(cardView, at: 0)
           remainingcards -= 1
       }
       
       func addCardFrame(index: Int, cardView: SwipesView) {
           var cardViewFrame = bounds
           let horizontalInset = (CGFloat(index) * self.horizontalInset)
           let verticalInset = CGFloat(index) * self.verticalInset
           
           cardViewFrame.size.width -= 2 * horizontalInset
           cardViewFrame.origin.x += horizontalInset
           cardViewFrame.origin.y += verticalInset
           
           cardView.frame = cardViewFrame
       }
       
       private func removeAllCardViews() {
           for cardView in visibleCards {
               cardView.removeFromSuperview()
           }
           cardViews = []
       }
       
       func swipeDidEnd(on view: SwipesView) {
           guard let datasource = dataSource else { return }
           view.removeFromSuperview()

           if remainingcards > 0 {
               let newIndex = datasource.numberOfCardsToShow() - remainingcards
               addCardView(cardView: datasource.card(at: newIndex), atIndex: 2)
               for (cardIndex, cardView) in visibleCards.reversed().enumerated() {
                   UIView.animate(withDuration: 0.2, animations: {
                   cardView.center = self.center
                     self.addCardFrame(index: cardIndex, cardView: cardView)
                       self.layoutIfNeeded()
                   })
               }

           }else {
               for (cardIndex, cardView) in visibleCards.reversed().enumerated() {
                   UIView.animate(withDuration: 0.2, animations: {
                       cardView.center = self.center
                       self.addCardFrame(index: cardIndex, cardView: cardView)
                       self.layoutIfNeeded()
                   })
               }
           }
       }
}
