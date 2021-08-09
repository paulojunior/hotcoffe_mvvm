//
//  OrdersTableViewController.swift
//  HotCoffeMVVM
//
//  Created by Junior Ferreira on 08/08/21.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders() {
        
        guard let coffeOrdersURL = URL(string: "https://guarded-retreat-82533.herokuapp.com") else {
            fatalError("URL was incorrect")
        }
        
        let resource = Resource<[Order]>(url: coffeOrdersURL)
        
        WebService().load(resource: resource) { result in
            switch result {
                case .success(let orders):
                    print(orders)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
