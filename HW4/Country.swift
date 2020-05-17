//
//  Country.swift
//  HW4
//
//  Created by Winnie on 2020/5/12.
//  Copyright © 2020 Winnie. All rights reserved.
//

import Foundation

struct Country: Identifiable, Codable {
    let id = UUID()
    var country: String
    var selectedRegion: String
    var score: Int
    var day: Int
    var favorite: Bool
}
