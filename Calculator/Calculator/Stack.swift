//
//  Stack.swift
//  Calculator
//
//  Created by Ligia Frangello on 8/11/18.
//  Copyright © 2018 Ligia Frangello. All rights reserved.
//

import Foundation

struct Stack {
    fileprivate var array = [Any]()
    
    public func get(_ i : Int) -> Any?{
        return array[i]
    }
    
    mutating func pop() -> Any?{
        return array.popLast()
    }
    
    mutating func push(_ item: Any) {
        array.append(item)
    }
    
    public func isEmpty() -> Bool{
        return array.count == 0 ? true : false
    }
    
    public func getSize() -> Int{
        return array.count
    }
}
