//
//  ViewController.swift
//  testGQ
//
//  Created by Black on 2021/2/20.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var dict = Dictionary<String, Any>()
//    var emptyArray = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "数据界面"
        view.backgroundColor = .white
        
        view.addSubview(contextView)
        view.addSubview(nestBtn)
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(5), target: self, selector: #selector(lhy_timeChange), userInfo: nil, repeats: true)
    }
    
    func doNetRequest() {
        LHYNetTool.sharedNetWork()?.get("", parameters: nil, headers: nil, progress: nil, success: { [self] (_:URLSessionDataTask, data : Any?) in
            dict = data as! [String : Any]
            //保存数据到沙盒
            UserDefaults.standard.set(dicValueString(dict), forKey: "mainKey");
            contextView.text = dicValueString(dict)
            
            //保存历史数据
            var historyArr = UserDefaults.standard.object(forKey: "historyKey") as? [String]
            if historyArr == nil{
                historyArr = (NSMutableArray() as! [String])
            }
            historyArr?.append(dicValueString(dict) ?? "空值")
            UserDefaults.standard.set(historyArr, forKey: "historyKey")
            UserDefaults.standard.synchronize()
        }, failure: { (_: URLSessionDataTask?, Error) in
            print(Error)
        })
    }
    
    @objc func lhy_timeChange() {
        doNetRequest()
    }
    
    @objc func lhy_BtnClick() {
        let historyVC = HistoryController()
        let historyArr = UserDefaults.standard.object(forKey: "historyKey") as? [String]
        historyVC.dataArr = historyArr ?? ["空值"]
        navigationController?.pushViewController(historyVC, animated: true)
    }
    
    private lazy var contextView : UITextView = {
        let contextView = UITextView(frame: CGRect(x: 30, y: 100, width: UIScreen.main.bounds.size.width - 60, height: 500))
        contextView.backgroundColor = .red
        contextView.font = .systemFont(ofSize: 20)
        
        let context = UserDefaults.standard.object(forKey: "mainKey")
        print(context as Any)
        if (context != nil) {
            contextView.text = (context as! String)
        }
        return contextView
    }()
    
    private lazy var nestBtn : UIButton = {
        let btn = UIButton(frame: CGRect(x: 30, y: contextView.frame.maxY + 8, width: contextView.frame.width, height: 44))
        btn.setTitle("历史数据", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .purple
        btn.addTarget(self, action: #selector(lhy_BtnClick), for: .touchUpInside)
        return btn
    }()
    
    
    // 转成Int
    func toInt(_ v: Any?) -> Int {
        guard let v = v else {
            return 0
        }
        if let num = v as? NSNumber {
            return num.intValue
        } else if let str = v as? String {
            return Int(str) ?? 0
        } else {
            return 0
        }
    }
    
    /// 转成String
    func toString(_ v: Any?) -> String {
        guard let v = v else { return "" }
        if v is String {
            return v as! String
        } else if let num = v as? NSNumber {
            return num.stringValue
        }
        return ""
    }
    
    // MARK: 字典转字符串
    func dicValueString(_ dic:[String : Any]) -> String?{
        let data = try? JSONSerialization.data(withJSONObject: dic, options: [])
        let str = String(data: data!, encoding: String.Encoding.utf8)
        return str
    }
    
}

