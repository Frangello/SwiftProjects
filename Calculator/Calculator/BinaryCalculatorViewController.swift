//
//  BinaryCalculatorViewController.swift
//  Calculator
//
//  Created by Ligia Frangello on 8/11/18.
//  Copyright © 2018 Ligia Frangello. All rights reserved.
//

import UIKit

extension String {
    var hexaToInt      : Int    { return Int(strtoul(self, nil, 16))      }
    var hexaToDouble   : Double { return Double(strtoul(self, nil, 16))   }
    var hexaToBinary   : String { return String(hexaToInt, radix: 2)      }
    var decimalToHexa  : String { return String(Int(self) ?? 0, radix: 16)}
    var decimalToBinary: String { return String(Int(self) ?? 0, radix: 2) }
    var binaryToInt    : Int    { return Int(strtoul(self, nil, 2))       }
    var binaryToDouble : Double { return Double(strtoul(self, nil, 2))   }
    var binaryToHexa   : String { return String(binaryToInt, radix: 16)  }
}

class BinaryCalculatorViewController: UIViewController {
    
    var stack = Stack()
    @IBOutlet var displayLabel: UILabel!
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            performSegue(withIdentifier: "thirdSegue", sender: self)
            print("swiped the edge")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Swipe from Edge
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        view.addGestureRecognizer(edgePan)
        
//        var swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showSecondViewController")
//        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Up
//        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func zeroAction(_ sender: UIButton) {
        updateStack(0)
    }
    
    @IBAction func oneAction(_ sender: UIButton) {
        updateStack(1)
    }
    
    @IBAction func multAction(_ sender: UIButton) {
        updateStack("*")
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        updateStack("+")
    }
    
    @IBAction func divAction(_ sender: UIButton) {
        updateStack("/")
    }
    
    @IBAction func subAction(_ sender: UIButton) {
        updateStack("-")
    }
    
    @IBAction func equalAction(_ sender: UIButton) {
        var total = 0
        var l : Int = 0
        var last : Any
        while(!stack.isEmpty()){
            last = stack.pop()!
            if(last is String){
                let op : String = last as! String
                let r : Int = stack.pop() as! Int
                switch(op){
                case "*":
                    total += String(l).binaryToInt * String(r).binaryToInt
                case "+":
                    total += String(l).binaryToInt + String(r).binaryToInt
                case "-":
                    total += String(l).binaryToInt - String(r).binaryToInt
                case "/":
                    total += String(l).binaryToInt / String(r).binaryToInt
                default:
                    total += 0
                }
            }
            else{
                l = last as! Int
            }
        }
        updateStack(Int(String(total, radix: 2))!)
    }
    
    @IBAction func cAction(_ sender: UIButton) {
        while(!stack.isEmpty()){
            stack.pop()
        }
        updateDisplay()
    }
    
    @IBAction func ceAction(_ sender: UIButton) {
        let num = stack.pop();
        if(num is Int){
            stack.push((num as! Int)/10)
        }
        updateDisplay()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func updateStack(_ new : Any){
        if(!stack.isEmpty()){
            let last : Any = stack.pop()!
            
            //Symbol
            if(last is String){
                //Num
                if(new is Int){
                    stack.push(last)
                    stack.push(new)
                }
                    //Symbol
                else{
                    stack.push(last)
                }
            }
                //Num
            else{
                //Num
                if(new is Int){
                    stack.push((last as! Int) * 10 + (new as! Int))
                }
                    //Symbol
                else{
                    stack.push(last)
                    stack.push(new)
                }
            }
        }
        else{
            stack.push(new)
        }
        updateDisplay()
    }
    
    func updateDisplay(){
        var text = ""
        let size = stack.getSize()
        if(size > 0){
            for i in 0...stack.getSize()-1 {
                text += "\(stack.get(i) ?? "")"
            }
        }
        displayLabel.text = text
    }

}
