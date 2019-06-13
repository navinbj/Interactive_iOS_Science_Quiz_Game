//
//  LeaderboardViewController.swift
//  Assignment1_IOS_NBajgai
//
//  Created by Bajgai Navin on 5/9/19.
//  Copyright © 2019 Bajgai Navin. All rights reserved.
//

import UIKit
import Foundation

//class LeaderboardViewController extends table view properties
class LeaderboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //function for returning the number of rows in a table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getPlayers().count
    }
    
    //function for returning the cell in a table including the information held in the cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath as IndexPath)
        let players = getPlayers()
        cell.textLabel?.text = "\(players[indexPath.row].getplayerName())\t\t\t\t \(players[indexPath.row].getScore())\t\t \(players[indexPath.row].getStreak())"
        return cell
    }
    
    var players = [Player]()
    let cellIdentifer = "myCellIdentifier"
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Leaderboard View Controller"
        
        //reading contents from text file
        do {
            // get the documents folder url
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                // create the destination url for the text file to be saved
                let fileURL = documentDirectory.appendingPathComponent("playerStats2.txt")
                
                // reading from the file
                let data = try String(contentsOf: fileURL,encoding: .utf8)      //get all data from a text file
                let lineOfData = data.components(separatedBy: .newlines)        //seperate the data by a new line
                
                //seperate each line of data in a text file by a comma and print them out
                for item in lineOfData {
                    let subItem = item.components(separatedBy: ",")
                    if subItem[0] == "" {
                        break
                    }
                    else {
                        players.append(Player(playerName: subItem[0], score: Int(subItem[1])!, streak: Int(subItem[2])!))
                        print("\(subItem[0]),\t\t\t\(subItem[1]),\t\t\t\(subItem[2])")
                    }
                }

            }
        } catch {
            print("error:", error)
        }
    }
    
    //returns all players
    open func getPlayers()->[Player]
    {
        return players
    }
}
