//
//  DetailViewController.swift
//  Ski Collection
//
//  Created by Ligia Frangello on 8/14/18.
//  Copyright © 2018 Ligia Frangello. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var allMtnStatLabel: UILabel!
    @IBOutlet var parkStatLabel: UILabel!
    

    var selectedImage : String?
    var name : String?
    var allMtnStat : String = ""
    var parkStat : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = name

        //Only executes if selectedImage is not nil
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }
        
        allMtnStatLabel.text = allMtnStat
        parkStatLabel.text = parkStat
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
