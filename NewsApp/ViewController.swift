//
//  ViewController.swift
//  NewsApp
//
//  Created by 佐藤優衣 on 2017/02/14.
//  Copyright © 2017年 Yui Sato. All rights reserved.
//

import UIKit
//import Alamofire
//import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
        // 2. StoryBoardとつなぐ

    
    @IBOutlet weak var tableView: UITableView!
        
        // 5. テーブルに表示するテキスト
        let texts = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // 4. delegateとdataSourceを設定
            tableView.delegate = self
            tableView.dataSource = self
        }

        // 6. 必要なtableViewメソッド
        // セルの行数
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print("hogehoge")
            return texts.count
        }
        
        // 6. 必要なtableViewメソッド
        // セルのテキストを追加
        internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
            
            cell.textLabel?.text = texts[indexPath.row]
            return cell
        }
        
        // 7. セルがタップされた時
        private func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:IndexPath) {
            print(texts[indexPath.row])
        }
        
    
    
    }

