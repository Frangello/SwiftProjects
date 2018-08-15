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
    @IBOutlet var allMtnStat: UILabel!
    @IBOutlet var parkStat: UILabel!
    
    var selectedImage : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage

        //Only executes if selectedImage is not nil
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
