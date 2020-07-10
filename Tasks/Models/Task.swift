//
//  Task.swift
//  Tasks
//
//  Created by Katarina Veljkovic on 08/07/2020.
//  Copyright © 2020 Katarina Veljkovic. All rights reserved.
//

import Foundation
import UIKit

struct Task{
    var ime : String = ""
    var prioritet : Prioritet = Prioritet.jedan
    var boja : UIColor = .red
    var date : Date = Date()
    var isUrgent : Bool = false
    var phases : [Set] = []

}
