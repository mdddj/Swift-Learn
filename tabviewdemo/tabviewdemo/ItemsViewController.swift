//
//  ItemsViewController.swift
//  tabviewdemo
//
//  Created by ldd on 2022/3/4.
//

import Foundation
import UIKit

class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.updateLabels()
        let item = itemStore.allItems[indexPath.row]
//        cell.textLabel?.text = item.name
//        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        cell.nameLable.text = item.name
        cell.serialNumerLabel.text = item.serialNumber
        cell.valueLabel.text = "\(item.valueInDollars)"
        return cell
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let statusBarHeight = UIApplication.shared.statusBarFrame.height // 已被弃用
        let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        //tableView.rowHeight = 65 //设置子项目的高度
        
        //动态计算高度
        tableView.rowHeight = UITableView.automaticDimension // UITableView.automaticDimension 是rowHeight属性的默认值
        tableView.estimatedRowHeight  = 65 // estimatedRowHeight 可以提高UITableView的性能
    }
    
    //添加新行
    @IBAction func addNewItem(sender: AnyObject) {
        itemStore.createItem()
        let lastRow = tableView.numberOfRows(inSection: 0)
        let indexPath = IndexPath(row: lastRow, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    //编辑新行
    @IBAction func toggleEditingMode(sender: AnyObject){
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        }
        else
        {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }
    
    //执行删除
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            
            let item = itemStore.allItems[indexPath.row]
            let title = "删除\(item.name)?"
            let message = "您确定要删除这个项目吗?"
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteActin = UIAlertAction(title: "删除", style: .destructive) { UIAlertAction in
                self.itemStore.removeItem(item: item)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            ac.addAction(deleteActin)
            //显示弹窗
            present(ac,animated: true,completion: nil)
            
            
            
        }
    }
    
    //移动目标
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItemAtIndex(formIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row) //移动数据源
    }
}
