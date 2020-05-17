//
//  CountryData.swift
//  HW4
//
//  Created by Winnie on 2020/5/12.
//  Copyright © 2020 Winnie. All rights reserved.
//

import Foundation
import Combine

class CountriesData: ObservableObject{
    var cancellable: AnyCancellable?
    @Published var countries = [Country]()
    
    init(){
        // 解碼，讀檔
        if let data = UserDefaults.standard.data(forKey: "countries"){
          let decoder = JSONDecoder()
          if let decodedData = try? decoder.decode([Country].self, from: data){
            countries = decodedData
          }
        }
        // 編碼，存檔
        cancellable = $countries
            .sink(receiveValue: { (value) in
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(value) {
              UserDefaults.standard.set(data, forKey: "countries")
             }
            })
    }
}
