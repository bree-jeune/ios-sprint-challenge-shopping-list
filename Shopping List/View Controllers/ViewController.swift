//
//  ViewController.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController {
    
    @IBOutlet weak var itemsLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    
    @IBAction func sendOrderButtonPressed(_ sender: UIButton) {
        
        guard let name = nameTextField.text, let address = addressTextField.text, !name.isEmpty, !address.isEmpty else { return }
        
            sendAlert(to: name, at: address)
    }
    
    
    var itemCount: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }

       private func updateViews() {
        guard let itemCount = itemCount else { return }

        itemsLabel.text = "You have \(itemCount) item(s) in your shopping list."
    }
    
    private func sendAlert(to name: String, at address: String) {
        let title = "Delivery for \(name)!"
        let message = "Your items will be delivered to \(address) in 15 minutes."

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)


        let action = UIAlertAction(title: "Ok", style: .default) { alert in self.navigationController?.popToRootViewController(animated: true)}
        alert.addAction(action)

        present(alert, animated: true)
    }


}


