//
//  ViewController.swift
//  Ski Collection
//
//  Created by Ligia Frangello on 8/14/18.
//  Copyright © 2018 Ligia Frangello. All rights reserved.
//

import UIKit
import CoreData

//UITableViewController adds the ability to show rows of data that can be scrolled and selected
class ViewController: UITableViewController {
    
    var skis = [Ski]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Ski Viewer"
        
        populateSkis()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Sets how many rows are shown
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath)
        cell.textLabel?.text = skis[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // load the detailViewController view
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            //set image in the detail vc with the url of the selected row
            let tmpSki = skis[indexPath.row]
            vc.selectedImage = tmpSki.url
            vc.parkStat = tmpSki.parkStats
            vc.allMtnStat = tmpSki.allMtnStats
            vc.name = tmpSki.name
            
            // push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func populateSkis(){
//        guard let gitUrl = URL(string: "https://github.com/Frangello/SwiftProjects/blob/master/Ski%20Collection/Ski%20Collection/skisJSON.json") else { return }
//        URLSession.shared.dataTask(with: gitUrl) { (data, response
//            , error) in
//            guard let data = data else { return }
//            print(data)
//            do {
//                let decoder = JSONDecoder()
//                let gitData = try decoder.decode(Skis.self, from: data)
//                print(gitData.skis)
//
//            } catch let err {
//                print("Err", err)
//            }
//            }.resume()
        
        //TODO: read from json file instead
        let jsonString = """
        {
            "skis": [
                {
                "url": "ski_dps.jpg",
                "name": "DPS Alchemist Nina",
                "parkStats": "0",
                "allMtnStats": "8"
                },
                {
                "url": "ski_faction.jpg",
                "name": "Faction Candide Tovex",
                "parkStats": "6",
                "allMtnStats": "7"
                }
            ]
        }
        """
        
        do {
            let data = Data(jsonString.utf8)
            let decoder = JSONDecoder()
            skis = try decoder.decode(Skis.self, from: data).skis
        } catch {
            print("error: ", error)
        }
    }
    
}

