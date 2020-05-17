//
//  CountryList.swift
//  HW4
//
//  Created by Winnie on 2020/5/13.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

struct CountryList: View {
    @ObservedObject var countriesData = CountriesData()
    @State private var show = false
    var body: some View {
        NavigationView {
            List {
                ForEach(countriesData.countries){ (country) in
                    NavigationLink(destination: CountryEditor(countriesData:  self.countriesData, editCountry: country)) {
                        CountryRow(country1: country)
                    }
                }
                .onMove { (indexSet, index) in
                    self.countriesData.countries.move(fromOffsets: indexSet,
                                    toOffset: index)
                }
                .onDelete{ (index) in
                    self.countriesData.countries.remove(atOffsets: index)
                }
            }
            .navigationBarTitle("Country List")
            .navigationBarItems(leading: EditButton().accentColor(.green), trailing: Button(action: {
                    self.show = true
                },label: {
                    Image(systemName: "calendar.badge.plus")
                        .accentColor(.purple)
                    }))
                .sheet(isPresented: $show){
                    NavigationView {
                        CountryEditor(countriesData: self.countriesData) // 新增時不用修改
                    }
            }
        }
    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList()
    }
}
