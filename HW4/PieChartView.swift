//
//  PieChartView.swift
//  HW4
//
//  Created by Winnie on 2020/5/13.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

struct PieChartView: View {
    var percentages:[Double]?
    var angles: [Angle]
    
    init(percentages: [Double]){
        var sum: Double = 0
        var finalpercentage: [Double] = [0,0,0,0,0,0,0]
        for i in 0..<7 {
         sum = sum + percentages[i]
        }
        
        for j in 0..<7 {
            finalpercentage[j] = percentages[j] / sum
        }
        
        angles = [Angle]()
        var startDegree: Double = 0
        for percentage in finalpercentage {
            angles.append(.degrees(startDegree))
            startDegree += 360 * percentage
        }
    }
    
    var body: some View {
        ZStack {
            PieChart(startAngle: self.angles[0], endAngle: self.angles[1])
                .fill(Color.red)
            PieChart(startAngle: self.angles[1], endAngle: self.angles[2])
                .fill(Color.orange)
            PieChart(startAngle: self.angles[2], endAngle: self.angles[3])
                .fill(Color.yellow)
            PieChart(startAngle: self.angles[3], endAngle: self.angles[4])
                .fill(Color.green)
            PieChart(startAngle: self.angles[4], endAngle: self.angles[5])
                .fill(Color.blue)
            PieChart(startAngle: self.angles[5], endAngle: self.angles[6])
                .fill(Color(hue: 0.627, saturation: 1.0, brightness: 1.0))
            PieChart(startAngle: self.angles[6], endAngle: self.angles[0])
                .fill(Color.purple)
        }.frame(width: 300, height: 300)
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(percentages: [5, 10, 15, 20, 25, 15, 10])
    }
}

