//
//  ContactsData.swift
//  Contacts
//
//  Created by Thallapalli Rajachandra on 11/03/20.
//  Copyright © 2020 Thallapalli Rajachandra. All rights reserved.
//

import Foundation

let nameKey = "nameKey"
let numberKey = "numberKey"
let isSelectedKey = "selectedKey"
let dataKey = "dataKey"

struct Contacts {

    var name = ""
    var phoneNumber = ""
    var isSelected = false
    
}
class ContactsManager {
    let defaults = UserDefaults.standard
    
    func storeData(array : [Contacts]) {
        
        var store = [[String:Any]]()
        for item in array {
            store.append([nameKey:item.name, numberKey:item.phoneNumber, isSelectedKey:item.isSelected])
        }
        defaults.set(store, forKey: dataKey)
    }
    
    func getData() -> [Contacts] {
        var value = [Contacts]()
        let loadedData = defaults.value(forKey: dataKey) as! [[String: Any]]
        for (_, item) in loadedData.enumerated() {
            var data = Contacts()
            data.name = item[nameKey] as! String
            data.phoneNumber = item[numberKey] as! String
            data.isSelected = item[isSelectedKey] as! Bool
            value.append(data)
        }
        return value
    }
    
    func dataDoesExist() -> Bool {
        if let data = defaults.value(forKey: dataKey) as? [[String: Any]] {
            return !data.isEmpty
        }
        return false
    }
    
}
