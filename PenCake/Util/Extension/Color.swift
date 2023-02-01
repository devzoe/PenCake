//
//  Color.swift
//  PenCake
//
//  Created by 남경민 on 2023/02/01.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
      }
    
    static let pencakeBlue = Color(hex: "#71bdc9") //blue
    static let pencakeGray = Color(hex: "#a7a7a7") //gray
}
