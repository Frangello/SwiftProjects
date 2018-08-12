//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Ligia Frangello on 8/11/18.
//  Copyright © 2018 Ligia Frangello. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet var displayLabel: UILabel!
    
    var stack = Stack()
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            performSegue(withIdentifier: "fourthSegue", sender: self)
            print("swiped the edge")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func oneAction(_ sender: UIButton) {
        updateStack(1)
    }
    
    @IBAction func twoAction(_ sender: UIButton) {
        updateStack(2)
    }
    
    @IBAction func threeAction(_ sender: UIButton) {
        updateStack(3)
    }
    
    @IBAction func fourAction(_ sender: UIButton) {
        updateStack(4)
    }

    @IBAction func fiveAction(_ sender: UIButton) {
        updateStack(5)
    }

    @IBAction func sixAction(_ sender: UIButton) {
        updateStack(6)
    }

    @IBAction func sevenAction(_ sender: UIButton) {
        updateStack(7)
    }

    @IBAction func eightAction(_ sender: UIButton) {
        updateStack(8)
    }

    @IBAction func nineAction(_ sender: UIButton) {
        updateStack(9)
    }

    @IBAction func zeroAction(_ sender: UIButton) {
        updateStack(0)
    }

    @IBAction func ceAction(_ sender: UIButton) {
        let num = stack.pop();
        if(num is Int){
            stack.push((num as! Int)/10)
        }
        updateDisplay()
    }

    @IBAction func cAction(_ sender: UIButton) {
        while(!stack.isEmpty()){
            stack.pop()
        }
        updateDisplay()
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
        var total : Int = 0
        var l : Int = 0
        var last : Any
        while(!stack.isEmpty()){
            last = stack.pop()!
            if(last is String){
                let op : String = last as! String
                let r : Int = stack.pop() as! Int
                switch(op){
                case "*":
                    total += l * r
                case "+":
                    total += l + r
                case "-":
                    total += l - r
                case "/":
                    total += l / r
                default:
                    total += 0
                }
            }
            else{
                l = last as! Int
            }
        }
        updateStack(total)
    }
    
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
