//
//  ContentView.swift
//  HW4
//
//  Created by Winnie on 2020/5/12.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var countryData = CountriesData()
    var body: some View {
        VStack{
            TabView {
                CountryList(countriesData: self.countryData)
                    .tabItem {
                        Text("List")
                        Image(systemName: "globe")
                }
                ChartView(countryData: self.countryData)
                    .tabItem{
                    Image(systemName: "chart.pie")
                    Text("Chart")
                }
            }
            .accentColor(.orange)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
