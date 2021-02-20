//
//  TableViewCell.swift
//  testGQ
//
//  Created by Black on 2021/2/20.
//

import UIKit

let HistoryCell_ID = "TableViewCell"

class TableViewCell: UITableViewCell {

    var textStr : String?{
        didSet{
            contextView.text = textStr
        }
    }

    @objc public class func cd_cell(tableView:UITableView,indexPath:NSIndexPath) -> Self {
        var cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell_ID) as? TableViewCell
        //这下面的代码可以不用写,其实只要给tableView注册一个cell的类型就可以
        if cell == nil {
            cell = TableViewCell(style: .default, reuseIdentifier: HistoryCell_ID)
        }
        return cell as! Self
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(contextView)
        contentView.addSubview(lineV)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var contextView : UITextView = {
        let contextView = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 150))
        contextView.backgroundColor = .red
        return contextView
    }()
    private lazy var lineV : UIView = {
        let lineV = UIView(frame: CGRect(x: 0, y: 149, width: UIScreen.main.bounds.size.width, height: 1))
        lineV.backgroundColor = .black
        return lineV
    }()
}
