//
//  HistoryController.swift
//  testGQ
//
//  Created by Black on 2021/2/20.
//

import UIKit



class HistoryController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    public var dataArr  : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "历史数据"
        view.addSubview(historyTableView)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCell.cd_cell(tableView: tableView, indexPath: indexPath as NSIndexPath)
        cell.textStr = dataArr[indexPath.row]
        return cell
    }
    
    private lazy var historyTableView : UITableView = {
        let historyTableView = UITableView(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.size.height + 44, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - UIApplication.shared.statusBarFrame.size.height - 44), style: .plain)
        historyTableView.backgroundColor = .red
        historyTableView.delegate = self
        historyTableView.dataSource = self
        historyTableView.sectionHeaderHeight = 0.01
        historyTableView.sectionFooterHeight = 0.01
        historyTableView.showsVerticalScrollIndicator = false
        historyTableView.separatorStyle = .none
        if #available(iOS 11.0, *) {
            historyTableView.contentInsetAdjustmentBehavior = .never
        }
        return historyTableView
    }()
    
    //
    //    func isiPhoneX() ->Bool {
    //        let screenHeight = UIScreen.main.nativeBounds.size.height;
    //        if screenHeight == 2436 || screenHeight == 1792 || screenHeight == 2688 || screenHeight == 1624 {
    //            return true
    //        }
    //        return false
    //    }
    
}
