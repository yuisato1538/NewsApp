//
//  ViewController.swift
//  NewsApp
//
//  Created by 佐藤優衣 on 2017/02/14.
//  Copyright © 2017年 Yui Sato. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // 2. StoryBoardとつなぐ
    
    let urlString: String = "https://newsapi.org/v1/articles?source=wired-de&sortBy=top&apiKey=75347945f8ee43fdbb55917e1aeb30e4"
    var titles: [String] = []
    var descriptions: [String] = []
    var publishedAts: [String] = []
    var urls: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    // 5. テーブルに表示するテキスト
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let texts = [titles]
        // 4. delegateとdataSourceを設定
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetch() {
        
        Alamofire.request(urlString).response { response in
            
            if let data = response.data {
                
                let json: JSON = JSON(data)
                let articles = json["articles"].arrayValue
                for article in articles {
                    
                    self.titles.append(article["title"].stringValue)
                    self.descriptions.append(article["description"].stringValue)
                    self.publishedAts.append(article["publishedAt"].stringValue)
                    self.urls.append(article["article"].stringValue)
                }
            }
        }
    }
    
    // 6. 必要なtableViewメソッド
    // セルの行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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

