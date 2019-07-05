//
//  Weather.swift
//  weatherapp
//


import Foundation

struct Weather {
    let cityName : String
    let temp : Double
    let description : String
    let icon : String

    
     

init(cityName : String, temp : Double, description : String,icon : String) {
         self.cityName = cityName
         self.temp = temp
         self.description = description
         self.icon = icon
  }
}
