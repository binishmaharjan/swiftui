//
//  Video.swift
//  Africa
//
//  Created by Maharjan Binish on 2021/04/28.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headeline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
