//
//  Picture.swift
//  Ski Collection
//
//  Created by Ligia Frangello on 8/14/18.
//  Copyright © 2018 Ligia Frangello. All rights reserved.
//

import Foundation
import UIKit

struct Ski: Decodable{
    let url : String
    let name : String
    let parkStats : String
    let allMtnStats : String
}

struct Skis : Decodable {
    let skis: [Ski]
    
    public func at(_ i : Int) -> Ski{
        return skis[i]
    }
    
    public func size() -> Int{
        return skis.count
    }
}
