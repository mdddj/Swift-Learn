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
    //删除元素
    func removeItem(item: Item){
        if let  index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }
    
    //移动顺序
    func moveItemAtIndex(formIndex: Int,toIndex:Int){
        if(formIndex == toIndex){
            return
        }
        let moveItem = allItems[formIndex]
        allItems.remove(at: formIndex)
        allItems.insert(moveItem, at: toIndex)
    }
}
