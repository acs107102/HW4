//
//  CountryEditor.swift
//  HW4
//
//  Created by Winnie on 2020/5/12.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

import SwiftUI

struct CountryEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var countriesData: CountriesData
    @State private var country = ""
    @State private var selectedRegion = ""
    @State private var score : CGFloat = 50
    @State private var day = 2
    @State private var favorite = true
    var disableForm: Bool {
        country.isEmpty || selectedRegion.isEmpty
    }
    
    var editCountry: Country?
    var region = ["Asia", "Europe", "North America", "South America", "Africa", "Oceania", "Antarctica"]
    
    var body: some View {
            Form {
                TextField("Country", text: $country)
                VStack{
                    Picker(selection: $selectedRegion, label: Text("Region")) {
                        ForEach(self.region, id:\.self) { (city) in
                            Text(city)
                        }
                    }
                }
                
                Stepper("Day: \(day)", value: $day, in: 2...60)
                HStack {
                    Text("Score: \(Int(score))")
                    Slider(value: $score, in: 1...100, step: 1)
                }
                Toggle("Do you like this country ?", isOn:  $favorite)
            }
            .navigationBarTitle(editCountry == nil ? "Add new Country" : "Edit Country")
            .navigationBarItems(trailing: Button("save"){
                let country = Country(country: self.country, selectedRegion: self.selectedRegion, score: Int(self.score), day: self.day, favorite: self.favorite)
                if let editCountry = self.editCountry{
                    let index = self.countriesData.countries.firstIndex{
                        $0.id == editCountry.id
                    }!      // 因為必有值，所以用驚嘆號
                    self.countriesData.countries[index] = country
                } else{
                    self.countriesData.countries.insert(country, at: 0)
                }
                self.presentationMode.wrappedValue.dismiss()
            }.disabled(disableForm))
       
                .onAppear{
                    if let editCountry = self.editCountry, self.country == "" {
                        self.country = editCountry.country
                        self.selectedRegion = editCountry.selectedRegion
                        self.day = editCountry.day
                        self.score = CGFloat(editCountry.score)
                        self.favorite = editCountry.favorite
                    }
        }
    }
}

struct CountryEditor_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CountryEditor(countriesData: CountriesData())
        }
    }
}
