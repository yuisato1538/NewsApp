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
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let urlString: String = "https://newsapi.org/v1/articles?source=google-news&sortBy=top&apiKey=9398f98083024f99a2144db7530b4db1"
    
    // 5. テーブルに表示するテキスト
    //let texts = (self.)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamo()
        
        //let texts = [self.titles]
        
        // 4. delegateとdataSourceを設定
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 6. 必要なtableViewメソッド
    // セルの行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    // 6. 必要なtableViewメソッド
    // セルのテキストを追加
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }
    
    var authors: [String] = []
    var titles: [String] = []
    var descriptions: [String] = []
    var urls: [String] = []
    func Alamo() {
        Alamofire.request(urlString).response {response in
            
            if let data = response.data{
                let json: JSON = JSON(data)
                let articles = json["articles"].arrayValue
                for article in articles {
                    self.titles.append(article["title"].stringValue)
                    print(self.titles)
                    self.authors.append(article["author"].stringValue)
                    print(self.authors)
                    self.descriptions.append(article["despription"].stringValue)
                    print(self.descriptions)
                    self.urls.append(article["url"].stringValue)
                    print(self.urls)
                }
                self.tableView.reloadData()
            }
        }
        
        
        
    }
    
    // 7. セルがタップされた時
    private func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:IndexPath) {
        print(titles[indexPath.row])
    }
    
    
    
}

