//
//  SwipesView.swift
//  Agri10x
//
//  Created by Akash Kumar on 06/10/21.
//

import Foundation
import UIKit

class SwipesView : UIView {
    var divisor : CGFloat = 0
    var shadowView : UIView!
       var imageView: UIImageView!
    @IBOutlet weak var SwipesView: UIView!
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.textColor = .lightGray
            descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        }
    }
    @IBOutlet weak var titleLabel: UILabel!{
        didSet {
            titleLabel.textColor = .black
            titleLabel.font = UIFont.systemFont(ofSize: 15)
        }
    }
    @IBOutlet weak var priceLabel: UILabel!{
        didSet {
            priceLabel.textColor = .red
            priceLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        }
    }
    @IBOutlet weak var profileImageView: UIImageView!
    var label = UILabel()
       var moreButton = UIButton()
       
       var delegate : SwipeCardsDelegate?
       
       
      
       var dataSource : UserDetails? {
           didSet {
               if let urlString = self.dataSource?.image,let imageUrl:URL = URL(string: urlString)  {
                   profileImageView.loadImge(withUrl: imageUrl)
               }
               if let title = dataSource?.title {
                titleLabel.text = title
               }
            if let desc = dataSource?.description {
                descriptionLabel.text = desc
            }
            if let price = dataSource?.price {
                priceLabel.text = "$\(price)"
            }
           }
       }
       
         var isSelected: Bool = false
       
      
       override func awakeFromNib() {
           configureShadowView()
           configureSwipesView()
          // mapView.isHidden = true
           addPanGestureOnCards()
       }
       
       
       func configureShadowView() {
           shadowView = UIView()
           shadowView.backgroundColor = .clear
           shadowView.layer.shadowColor = UIColor.black.cgColor
           shadowView.layer.cornerRadius = 15
           shadowView.clipsToBounds = true
           shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
           shadowView.layer.shadowOpacity = 0.8
           shadowView.layer.shadowRadius = 4.0
           addSubview(shadowView)
           shadowView.translatesAutoresizingMaskIntoConstraints = false
           shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
           shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
           shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
           shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
       }
       
       func configureSwipesView() {
           SwipesView.layer.cornerRadius = 15
           SwipesView.clipsToBounds = true
           shadowView.addSubview(SwipesView)
           
           SwipesView.translatesAutoresizingMaskIntoConstraints = false
           SwipesView.leftAnchor.constraint(equalTo: shadowView.leftAnchor).isActive = true
           SwipesView.rightAnchor.constraint(equalTo: shadowView.rightAnchor).isActive = true
           SwipesView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor).isActive = true
           SwipesView.topAnchor.constraint(equalTo: shadowView.topAnchor).isActive = true
       }
       
       
      
       
       func addPanGestureOnCards() {
           self.isUserInteractionEnabled = true
            addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
           
       }
       
       
       @objc func handlePanGesture(sender: UIPanGestureRecognizer){
           let card = sender.view as! SwipesView
           let point = sender.translation(in: self)
           let centerOfParentContainer = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
           card.center = CGPoint(x: centerOfParentContainer.x + point.x, y: centerOfParentContainer.y + point.y)
           
           divisor = ((UIScreen.main.bounds.width / 2) / 0.61)
           
           switch sender.state {
           case .ended:
               if (card.center.x) > 300 {
                   delegate?.swipeDidEnd(on: card)
                   if let model = dataSource {
                       let dict = ["id":model.id ?? 0,"category":model.category ?? "","description":model.description ?? "","price":model.price ?? 0.0,"image":model.image ?? "","title":model.title ?? "", "rate":model.rating?.rate ?? 0.0, "count":model.rating?.count ?? 0] as [String : Any]
                       DatabaseHelper.sharedInstance.saveData(object: dict as [String : AnyObject])
                   }
                   UIView.animate(withDuration: 0.2) {
                       card.center = CGPoint(x: centerOfParentContainer.x + point.x + 200, y: centerOfParentContainer.y + point.y + 75)
                       card.alpha = 0
                       self.layoutIfNeeded()
                   }
                   return
               }else if card.center.x < 65 {
                   delegate?.swipeDidEnd(on: card)
                   UIView.animate(withDuration: 0.2) {
                       card.center = CGPoint(x: centerOfParentContainer.x + point.x - 200, y: centerOfParentContainer.y + point.y + 75)
                       card.alpha = 0
                       self.layoutIfNeeded()
                   }
                   return
               }
               UIView.animate(withDuration: 0.2) {
                   card.transform = .identity
                   card.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
                   self.layoutIfNeeded()
               }
           case .changed:
               let rotation = tan(point.x / (self.frame.width * 2.0))
               card.transform = CGAffineTransform(rotationAngle: rotation)
           default:
               break
           }
       }
       
       
       
       
       class func loadNib(from viewController: UIViewController) -> SwipesView {
           let nib = UINib(nibName: "SwipesView", bundle: nil).instantiate(withOwner:nil, options: nil)[0] as! SwipesView
           return nib
       }
       
   }
