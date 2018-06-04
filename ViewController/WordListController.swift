//
//  WordListTableViewController.swift
//  单词app
//
//  Created by 金乃德 on 2018/5/30.
//  Copyright © 2018年 金乃德. All rights reserved.
//

import UIKit
import LeanCloud
import CoreData

class WordListController: UITableViewController {

    // MARK: - Table view data source
    
    let context = AppDelegate.viewContext
    var wordlist: [LCObject] = []
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.bounds.height / 2
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.wordlist.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordListCell", for: indexPath)
        if let myTVCell = cell as? MyTVC {
            let wordListName = wordlist[indexPath.row].get("WordListName")?.stringValue
            let wordListClass = wordlist[indexPath.row].get("WordListClass")?.stringValue
            myTVCell.wordListName.text = wordListName
            myTVCell.wordListClass = wordListClass ?? "Word"
            myTVCell.wordListImage.image = UIImage(named: "Image")
            myTVCell.downloadButton.setTitle("可下载", for: .normal)
            myTVCell.downloadButton.setTitle("已下载", for: .disabled)

        }

        return cell
    }
}
