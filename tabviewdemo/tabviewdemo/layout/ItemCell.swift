//
//  ItemCell.swift
//  tabviewdemo
//
//  Created by ldd on 2022/3/9.
//

import UIKit

class ItemCell:UITableViewCell {
    @IBOutlet var nameLable: UILabel!
    @IBOutlet var serialNumerLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    // 响应用户的修改
    func updateLabels(){
        let bodyFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        nameLable.font = bodyFont
        valueLabel.font = bodyFont
        let captioinFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
        serialNumerLabel.font = captioinFont
    }
}
