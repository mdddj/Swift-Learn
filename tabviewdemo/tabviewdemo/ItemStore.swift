//
//  ItemStore.swift
//  tabviewdemo
//
//  Created by ldd on 2022/3/4.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    
    func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    init() {
        for _ in 0 ..< 5 {
            createItem()
        }
    }
}
