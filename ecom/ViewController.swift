//
//  ViewController.swift
//  ecom
//
//  Created by Rohit Dhakad on 27/10/23.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet var outfitTableview: UITableView!
    
    var productImageArray = [ #imageLiteral(resourceName: "image-1"), #imageLiteral(resourceName: "image"), #imageLiteral(resourceName: "image (2)"), #imageLiteral(resourceName: "image (1)")]
    var productNameArray = ["Black top","Striped Tshirt","Checked top","White Top"]
    //    var priceArray = ["Rs. 1000","Rs. 1460","Rs. 1200","Rs. 1090"]
    //    var QuantityArray = ["1","1","1","1"]
    var priceArray = [1000.0, 1460.0, 1200.0, 1090.0]
    var quantityArray = [1, 1, 1, 1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Outfits"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 176
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! outfitTableViewCell
        
        cell.productImage.image = productImageArray[indexPath.row]
        cell.productName.text = productNameArray[indexPath.row]
        cell.price.text = "Rs. \(priceArray[indexPath.row])"
        cell.quantity.text = "\(quantityArray[indexPath.row])"
        cell.quantityUpdated = { [weak self] updatedQuantity in
                   self?.quantityArray[indexPath.row] = updatedQuantity // Update the quantity array
               }
        
      
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedProductName = productNameArray[indexPath.row]
        let selectedProductImage = productImageArray[indexPath.row]
        let selectedPriceArray = priceArray[indexPath.row]
        let selectedQtyArray = quantityArray[indexPath.row]
        
        let detailVC : detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! detailViewController
        
        detailVC.detailNameLabel = selectedProductName
        detailVC.detailProductImage = selectedProductImage
        detailVC.detailPriceLabel = selectedPriceArray
        detailVC.detailQtyLabel = selectedQtyArray
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    
    
    
    
}

