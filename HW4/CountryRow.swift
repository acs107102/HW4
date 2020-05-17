//
//  CountryRow.swift
//  HW4
//
//  Created by Winnie on 2020/5/12.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

struct CountryRow: View {
    var country1: Country
    var body: some View {
        HStack {
            Image("\(country1.country)")
                .resizable()
                .scaledToFit()
                .frame(width:20)
            Text("\(country1.country) / \(country1.selectedRegion)")
            Spacer()
            Text("\(country1.score) score")
            Image(systemName: country1.favorite ? "hand.thumbsup.fill": "hand.thumbsdown.fill")
        }
    }
}

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryRow(country1: Country(country: "Taiwan", selectedRegion: "Asia", score: 100, day: 30, favorite: true)).previewLayout(.sizeThatFits)
    }
}
