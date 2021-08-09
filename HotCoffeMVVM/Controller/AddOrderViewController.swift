//
//  AddOrderViewController.swift
//  HotCoffeMVVM
//
//  Created by Junior Ferreira on 08/08/21.
//
import Foundation
import UIKit

class AddOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var vm = AddCoffeOrderViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    private var coffeSizesSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.coffeSizesSegmentedControl = UISegmentedControl(items: self.vm.sizes)
        self.coffeSizesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.coffeSizesSegmentedControl)
        self.coffeSizesSegmentedControl.topAnchor.constraint(lessThanOrEqualTo: self.tableView.bottomAnchor, constant: 20).isActive = true
        
        self.coffeSizesSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.types!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeTypeTableViewCell", for: indexPath)
        cell.textLabel?.text = self.vm.types![indexPath.row]
        return cell
    }
    
    @IBAction func save() {
        let name = self.nameTextField.text
        let email = self.emailTextField.text
        
        let selectedSize = self.coffeSizesSegmentedControl.titleForSegment(at: self.coffeSizesSegmentedControl.selectedSegmentIndex)
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("Error in selecting coffe!")
        }
        
        self.vm.name = name
        self.vm.email = email
        self.vm.selectedSize = selectedSize
        self.vm.selectedType = self.vm.types![indexPath.row]
    }
}

