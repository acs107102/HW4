//
//  PieChart.swift
//  HW4
//
//  Created by Winnie on 2020/5/16.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

struct PieChart: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        Path { (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90))
    }
}
