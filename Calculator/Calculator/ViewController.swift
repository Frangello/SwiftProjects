//
//  ViewController.swift
//  Calculator
//
//  Created by Ligia Frangello on 8/11/18.
//  Copyright © 2018 Ligia Frangello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var dumbButton: UIButton!
    @IBOutlet var geniusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dumbImage = UIImage.gifImageWithName("dumb")
        dumbButton.setImage(dumbImage, for: .normal)
        
        let geniusImage = UIImage.gifImageWithName("genius")
        geniusButton.setImage(geniusImage, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dumbAction(_ sender: UIButton) {
        performSegue(withIdentifier: "firstSegue", sender: sender)
    }
    
    @IBAction func geniusAction(_ sender: UIButton) {
        performSegue(withIdentifier: "secondSegue", sender: sender)
    }
}

