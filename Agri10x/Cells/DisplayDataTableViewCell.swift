//
//  DisplayDataTableViewCell.swift
//  Agri10x
//
//  Created by Akash Kumar on 06/10/21.
//

import UIKit

class DisplayDataTableViewCell: UITableViewCell {

    @IBOutlet weak var productRatingCount: UILabel!
    @IBOutlet weak var prductRating: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productId: UILabel!
    @IBOutlet weak var productImageView: UIImageView! {
        didSet {
            productImageView.layer.cornerRadius = productImageView.bounds.size.width/2
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        productDescription.attributedText = nil
        productPrice.attributedText = nil
        productTitle.attributedText = nil
        productId.attributedText = nil
        productImageView.image = nil
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(data:Details?) {
        if let model = data {
            let idAttributeText = NSMutableAttributedString()
            idAttributeText.append(GlobalUtility.customFontString("price: ", font: UIFont.systemFont(ofSize: 14, weight: .bold), color: .black))
            idAttributeText.append(GlobalUtility.customFontString("$\(model.price) ", font: UIFont.systemFont(ofSize: 14), color: .red))
            productId.attributedText = idAttributeText
            productTitle.attributedText = GlobalUtility.customFontString(model.title ?? "", font: UIFont.systemFont(ofSize: 14, weight: .bold), color: .black)
            let ratingAttributeText = NSMutableAttributedString()
            ratingAttributeText.append(GlobalUtility.customFontString("ratings: ", font: UIFont.systemFont(ofSize: 14, weight: .bold), color: .systemBlue))
            ratingAttributeText.append(GlobalUtility.customFontString("\(model.rate)", font: UIFont.systemFont(ofSize: 14, weight: .bold), color: .black)
)
            productPrice.attributedText = ratingAttributeText
            let descAttributeText = NSMutableAttributedString()
            descAttributeText.append((GlobalUtility.customFontString("Description:\n", font: UIFont.systemFont(ofSize: 14, weight: .bold), color: .black)
            ))
            descAttributeText.append((GlobalUtility.customFontString(model.desc ?? "", font: UIFont.systemFont(ofSize: 14), color: .black)
            ))
            productDescription.attributedText = descAttributeText
            if let image = model.image , let imgUrl:URL = URL(string: image) {
                productImageView?.loadImge(withUrl: imgUrl)
            }
        }
    }
}
