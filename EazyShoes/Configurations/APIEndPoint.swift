//
//  APIEndPoint.swift
//  EazyShoes
//
//  Created by Alumno on 11/12/24.
//

import Foundation

enum APIEndPoint: String, CaseIterable{
    case women = "gender=WOMEN"
    case men = "gender=MEN"
    case kids = "gender=KIDS"
    
    var displayName: String{
        switch self {
        case .women:
            return "Women"
        case .men:
            return "Men"
        case .kids:
            return "Kids"
        }
    }
}
