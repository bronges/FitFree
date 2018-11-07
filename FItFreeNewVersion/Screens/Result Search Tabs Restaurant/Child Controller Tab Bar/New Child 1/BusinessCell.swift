//
//  BusinessCell.swift
//  FItFreeNewVersion
//
//  Created by Brice Nangue on 28.09.18.
//  Copyright © 2018 Brice  Nangue. All rights reserved.
//

import UIKit
import Kingfisher
import CDYelpFusionKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var imageBusiness: UIImageView!
    @IBOutlet weak var nameBusiness: UILabel!
    @IBOutlet weak var reviewImageBusiness: UIImageView!
    @IBOutlet weak var reviewLabelBusiness: UILabel!
    @IBOutlet weak var priceLabelBusiness: UILabel!
    @IBOutlet weak var distanceLabelBusiness: UILabel!
    @IBOutlet weak var addressLabelBusiness: UILabel!
    @IBOutlet weak var categoriesLabelBusiness: UILabel!
    
    var restaurant: CDYelpBusiness! {
        didSet{
            nameBusiness.text = restaurant.name
            distanceLabelBusiness.text = String(format: "%.2f", (restaurant.distance!)/1000) + " km"
            imageBusiness.kf.setImage(with: restaurant.imageUrl)
           
            reviewLabelBusiness.text = "\(restaurant.reviewCount ?? 0) Review(s)"
            priceLabelBusiness.text = restaurant.price
            
            reviewImageBusiness.image = UIImage(named: "\(String(format: "%.0f", restaurant.rating!))Stars")
            addressLabelBusiness.text = String((restaurant.location?.displayAddress![0])! + ", " + (restaurant.location?.displayAddress![1])!)
            var categoriesNames = [String]()
            for category in restaurant.categories!{
                categoriesNames.append(category.title!)
            }
             categoriesLabelBusiness.text = categoriesNames.joined(separator: ", ")
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageBusiness.image = nil
    }
    
    override func awakeFromNib() {
        imageBusiness.layer.cornerRadius = 4.0
        imageBusiness.clipsToBounds = true
        
        nameBusiness.preferredMaxLayoutWidth = nameBusiness.frame.size.width
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()
        nameBusiness.preferredMaxLayoutWidth = nameBusiness.frame.size.width

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
