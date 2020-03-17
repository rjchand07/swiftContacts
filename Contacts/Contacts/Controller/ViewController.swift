//
//  ViewController.swift
//  Contacts
//
//  Created by Thallapalli Rajachandra on 11/03/20.
//  Copyright © 2020 Thallapalli Rajachandra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var contactsArray = ContactsManager()
    var data = [Contacts]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
       
        self.tableView.register(UINib(nibName: "tCell", bundle: nil), forCellReuseIdentifier: "tCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        data = self.contactsArray.getData()
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tCell", for: indexPath) as! tCell
       
        cell.logoLabel?.text = String(data[indexPath.row].name.prefix(1))
        cell.nameLabel?.text = data[indexPath.row].name
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let _ : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let navigation1Controller = self.storyboard?.instantiateViewController(withIdentifier: "navigation") as! NavigationViewController
        navigation1Controller.contacts = self.contactsArray.getData()[indexPath.row]
        self.navigationController?.pushViewController(navigation1Controller, animated: true)
        
    }
}

