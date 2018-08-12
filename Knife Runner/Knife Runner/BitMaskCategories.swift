//
//  BitMaskCategories.swift
//  Knife Runner
//
//  Created by Ligia Frangello on 8/12/18.
//  Copyright © 2018 Ligia Frangello. All rights reserved.
//

import Foundation
import SpriteKit

//Categorizes the objects from a physics standpoint as well as detect contact and collision
//To add more objects just change the # to the right of the shift operator and
//implement these categories in the object class
let PersonCategory : UInt32 = 0x1 << 1
let KnifeCategory : UInt32 = 0x1 << 2
let FloorCategory : UInt32 = 0x1 << 3
