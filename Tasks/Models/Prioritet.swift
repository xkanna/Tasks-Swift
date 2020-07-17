//
//  Prioritet.swift
//  Tasks
//
//  Created by Katarina Veljkovic on 08/07/2020.
//  Copyright © 2020 Katarina Veljkovic. All rights reserved.
//

import Foundation

enum Prioritet : Int {
    case jedan = 1
    case dva = 2
    case tri = 3
    case cetiri = 4
    case pet = 5
    case sest = 6
    case sedam = 7
    case osam = 8
    case devet = 9
    case deset = 10
    
    func title() -> String {
        switch self {
        case .jedan:
            return "prvi"
        case .dva:
            return "drugi"
        case .tri:
            return "treci"
        case .cetiri:
            return "cetvrti"
        case .pet:
            return "peti"
        case .sest:
            return "sesti"
        case .sedam:
            return "sedmi"
        case .osam:
            return "osmi"
        case .devet:
            return "deveti"
        case .deset:
            return "deseti"
        }
    }
}
