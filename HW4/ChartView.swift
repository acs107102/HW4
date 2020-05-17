//
//  ChartView.swift
//  HW4
//
//  Created by Winnie on 2020/5/16.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

struct ChartView: View {
    @ObservedObject var countryData = CountriesData()
    @State private var selectedChart = "圓餅圖"
    var chart = ["圓餅圖", "柱狀圖"] // donut chart
    var region = ["Asia", "Europe", "North America", "South America", "Africa", "Oceania", "Antarctica"]
    var countryCount: [Double] = [0,0,0,0,0,0,0]
    
    init (countryData: CountriesData){
        for country in countryData.countries{
            for i in 0..<7{
                if country.selectedRegion == region[i]{
                    countryCount[i] += 1
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.init(hue: 0.123, saturation: 0.46, brightness: 1)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("曾經旅遊的國家分佈")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                Picker(selection: $selectedChart, label: Text("分析圖表")) {
                    ForEach(self.chart, id: \.self) { (Chart) in
                        Text(Chart)
                    }
                }
                    .pickerStyle(SegmentedPickerStyle())
                
                legend() // 圖例
                
                if self.selectedChart == "圓餅圖" {
                    PieChartView(percentages: countryCount)
                    .frame(width: 400, height: 300)
                }
                else if self.selectedChart == "柱狀圖" {
                    BarChartView(typeWidths: countryCount)
                    .frame(width: 400, height: 300)
                }
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(countryData: CountriesData())
    }
}

struct legend: View {
    var body: some View {
        VStack{
            HStack{
                Circle()
                    .fill(Color.red)
                    .frame(width: 20, height: 20)
                Text("Asia")
                Circle()
                    .fill(Color.orange)
                    .frame(width: 20, height: 20)
                Text("Europe")
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 20, height: 20)
                Text("North America")
            }
            HStack{
                Circle()
                    .fill(Color.green)
                    .frame(width: 20, height: 20)
                Text("South America")
                Circle()
                    .fill(Color.blue)
                    .frame(width: 20, height: 20)
                Text("Africa")
                Circle()
                    .fill(Color(hue: 0.627, saturation: 1.0, brightness: 1.0))
                    .frame(width: 20, height: 20)
                Text("Oceania")
            }
            HStack {
                Circle()
                    .fill(Color.purple)
                    .frame(width: 20, height: 20)
                Text("Antarctica")
            }
        }
    }
}
