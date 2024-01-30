//
//  detailViewController.swift
//  ecom
//
//  Created by Rohit Dhakad on 02/11/23.
//

import UIKit

class detailViewController: UIViewController {
    
    var detailNameLabel : String!
    var detailProductImage : UIImage!
    var detailPriceLabel : Double!
    var detailQtyLabel : Int!
    
    @IBOutlet var productImage: UIImageView?
    
    @IBOutlet var view1: UIView!
    
    @IBOutlet var productName: UILabel?
    @IBOutlet var productPrice: UILabel?
    @IBOutlet var productQuantity: UILabel!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var addButton: UIButton!
    
    @IBOutlet var view2: UIView!
    
    @IBOutlet var mrpLabel: UILabel!
    @IBOutlet var taxLabel: UILabel!
    @IBOutlet var discountLabel: UILabel!
    @IBOutlet var feesLabel: UILabel!
    
    @IBOutlet var totalAmount: UILabel!
    
    
    var detailQty: Int = 1 {
           didSet {
               productQuantity.text = "\(detailQty)"
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.layer.cornerRadius = 12.0
        view2.layer.cornerRadius = 12.0
        minusButton.layer.cornerRadius = 12.0
        addButton.layer.cornerRadius = 12.0
        productImage?.layer.cornerRadius = 12.0
        

        
        productName?.text = detailNameLabel
        productImage?.image = detailProductImage
        productPrice!.text = String(format: "Rs. %.2f", detailPriceLabel)
        if let initialQty = detailQtyLabel {
                   detailQty = initialQty
               } else {
                   // If detailQtyLabel is nil, set the default to 1
                   detailQty = 1
               }

               // Display the initial quantity
               productQuantity.text = "\(detailQty)"

               // Calculate and update the amount
               calculateAndUpdateAmount()
        
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
          detailQty += 1
          calculateAndUpdateAmount()
      }

      @IBAction func minusButtonTapped(_ sender: UIButton) {
          if detailQty > 0 {
              detailQty -= 1
              calculateAndUpdateAmount()
          }
      }

   
    
    func calculateAndUpdateAmount() {
           let taxRate: Double = 10.0
           let discountRate: Double = 5.0
       

           guard let price = detailPriceLabel else {
               // Handle the case when the price is nil or invalid
               // For example, set some default text:
               mrpLabel.text = "N/A"
               taxLabel.text = "N/A"
               discountLabel.text = "N/A"
               totalAmount.text = "N/A"
               return
           }

           let mrp = price * Double(detailQty)
           let tax = mrp * (taxRate / 100)
           let discount = mrp * (discountRate / 100)
        let fees = 95*Double(detailQty)
        let totalAmt = ((mrp + tax + Double(fees)) - discount)
    

           mrpLabel.text = String(format: "%.2f", mrp)
           taxLabel.text = String(format: "%.2f", tax)
           discountLabel.text = String(format: "%.2f", discount)
        feesLabel.text = String(format: "%.2f", fees)
           totalAmount.text = String(format: "%.2f", totalAmt)
       }



    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
