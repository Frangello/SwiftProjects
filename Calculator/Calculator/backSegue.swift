//
//  backSegue.swift
//  Calculator
//
//  Created by Ligia Frangello on 8/11/18.
//  Copyright © 2018 Ligia Frangello. All rights reserved.
//

import UIKit

class backSegue: UIStoryboardSegue {
    
    override func perform() {
        let firstVCView = self.source.view as UIView
        let secondVCView = self.destination.view as UIView
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        secondVCView.frame = CGRect(x: -screenWidth, y: 0.0, width: screenWidth, height: screenHeight)
        
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)
        
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            firstVCView.frame = firstVCView.frame.offsetBy(dx: screenWidth, dy:0.0)
            secondVCView.frame = secondVCView.frame.offsetBy(dx: screenWidth, dy: 0.0)
            
        }) { (Finished) -> Void in
            self.source.present(self.destination as UIViewController,
                                                            animated: false,
                                                            completion: nil)
        }
    }

}
