//
//  NavigationViewController.swift
//  Contacts
//
//  Created by Thallapalli Rajachandra on 12/03/20.
//  Copyright © 2020 Thallapalli Rajachandra. All rights reserved.
//

import UIKit
 
class NavigationViewController:  UIViewController {
    
    var contacts = Contacts.init(name: "", phoneNumber: "", isSelected: true)
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var favouriteLabel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstLabel.layer.cornerRadius = self.firstLabel.frame.height/2.0
        self.firstLabel.clipsToBounds = true
        self.firstLabel.text = String(contacts.name.prefix(1))
        self.contactLabel.text = contacts.name
        self.phoneNumberLabel.text = contacts.phoneNumber
        self.heartButtonTapped()
    }
    
    @IBAction func favouriteButtonClicked(_ sender: UIButton) {
        self.contacts.isSelected = !self.contacts.isSelected
        storeData()
        heartButtonTapped()
        
    }
    
    func heartButtonTapped(){
        if contacts.isSelected {
            self.favouriteLabel.setImage(UIImage(named: "heartFilled"), for: .normal)
        } else {
            self.favouriteLabel.setImage(UIImage(contentsOfFile: "heart1"), for: .normal)
        }
    }
    
    func storeData() {
        var value = [Contacts]()
        value = ContactsManager().getData()
        for (index,_) in value.enumerated() {
            if value[index].name == self.contacts.name {
                value[index].isSelected = self.contacts.isSelected
            }
        }
        ContactsManager().storeData(array: value)
    }
}
