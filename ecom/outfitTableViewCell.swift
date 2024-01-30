//
//  outfitTableViewCell.swift
//  ecom
//
//  Created by Rohit Dhakad on 27/10/23.
//

import UIKit

class outfitTableViewCell: UITableViewCell {

    @IBOutlet var cellView: UIView!
    
    
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productName: UILabel!
    @IBOutlet var price: UILabel!
    
    @IBOutlet var quantity: UILabel!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var addButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 12.0
        minusButton.layer.cornerRadius = 12.0
        addButton.layer.cornerRadius = 12.0
        productImage.layer.cornerRadius = 12.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    var quantityUpdated: ((Int) -> Void)?
    
    var qty = 0 {
            didSet {
                quantity.text = "\(qty)"
            }
        }

        @IBAction func plusButtonTapped(_ sender: UIButton) {
            qty += 1
            quantityUpdated?(qty)
        
        }

        @IBAction func minusButtonTapped(_ sender: UIButton) {
            if qty > 0 {
                qty -= 1
                quantityUpdated?(qty)
              
            }
        }
    
    

}
