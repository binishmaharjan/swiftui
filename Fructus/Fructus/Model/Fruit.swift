//
//  Fruit.swift
//  Fructus
//
//  Created by Maharjan Binish on 2020/10/26.
//

import SwiftUI

struct Fruit: Identifiable {
    
    var id: UUID = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
