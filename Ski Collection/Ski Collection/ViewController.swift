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
            vc.selectedImage = skis[indexPath.row].url
            
            // push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func populateSkis(){
        //Refer to persistent container
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //Create context from container
        let context = appDelegate.persistentContainer.viewContext

//        let entity = NSEntityDescription.entity(forEntityName: "Skis", in: context)
//        let newSki = NSManagedObject(entity: entity!, insertInto: context)
//
//        newSki.setValue("ski_4frnt.jpg", forKey: "url")
//        newSki.setValue("4Frnt Raven", forKey: "name")
//        newSki.setValue(5, forKey: "park_stats")
//        newSki.setValue(7, forKey: "allMtn_stats")
//
//        do {
//            try context.save()
//        } catch {
//            print("Failed saving")
//        }
       
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Skis")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let ski = Ski()
                ski.url = (data.value(forKey: "url") as! String)
                ski.name = (data.value(forKey: "name") as! String)
                ski.parksStats = (data.value(forKey: "park_stats") as! Int)
                ski.allMntStats = (data.value(forKey: "allMtn_stats") as! Int)
                skis.append(ski)
            }
            
        } catch {
            
            print("Failed")
        }
        
    }
    
}

