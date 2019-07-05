//
//  WeatherService.swift
//  weatherapp
//


import Foundation


protocol WeatherServiceDelegate {
    
    func setWeather(weather : Weather)

}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    func getWeather(city : String) {
    
       
        let path = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&units=metric&appid=3c767d2c340d11c20581edac28e39e37"
        let url = NSURL(string: path)
        let session = NSURLSessionTransferSizeUnknown
        let task = URLSession.shared.dataTask(with: url as! URL) {  (data : Data?, response : URLResponse?, error : Error?) -> Void in
            //print(">>>\(data)")
            let json = JSON(data)
            
            let lon = json["coord"]["lon"].double
            let lat = json["coord"]["lat"].double
            let temp = json["main"]["temp"].double
            let description = json["weather"][0]["description"].string
            let name = json["name"].string
            let icon = json["weather"][0]["icon"].string
            
            let weather = Weather(cityName: name!, temp: temp!, description: description!,icon:icon!)
            
           
            
            
            
            
            if self.delegate != nil
            {
                
                DispatchQueue.main.async{
                    
                
                self.delegate?.setWeather(weather: weather)
           
                }
            
            }
            
            
            
            
            print("Lat:\(lat) lon:\(lon) temp:\(temp) description:\(description)")
        }
        
        task.resume()
       
        
        
        
        
        
        
        
        
        
        
        
       /*
        print("Weather Service City:\(city)")
        
       
        let weather = Weather(cityName: city, temp: 237.12, description: "Nice Weather")
        
        if delegate != nil {
           delegate?.setWeather(weather: weather)
        }
    */
    
    }
}
