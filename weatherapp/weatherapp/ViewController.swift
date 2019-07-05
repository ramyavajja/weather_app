//
//  ViewController.swift
//  weatherapp
//


import UIKit

class ViewController: UIViewController,WeatherServiceDelegate {

    let weatherService = WeatherService()
    
    @IBOutlet weak var temp_label: UILabel!
    
    @IBOutlet weak var description_label: UILabel!
    @IBOutlet weak var city_label: UILabel!
    @IBOutlet weak var cityButton: UIButton!
    
    @IBOutlet weak var tempminlabel: UILabel!
    
    @IBOutlet weak var tempmaxlabel: UILabel!
    
    
    @IBOutlet weak var iconImage: UIImageView!
    
    
    @IBAction func setCityTapped(_ sender: UIButton) {
        
        
        print("City Button Tapped")
        openCityAlert()
    }
    
    
    
    func openCityAlert() {
        
        let alert = UIAlertController(title: "City", message: "Enter City Name", preferredStyle: UIAlertControllerStyle.alert)
        
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(cancel)
        
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)   { (action: UIAlertAction) in
            print(" OK")
            let textField = alert.textFields?[0]
            print(textField?.text)
            self.city_label.text = textField?.text
            let cityName = textField?.text
            self.weatherService.getWeather(city: cityName!)
        }
        
         alert.addAction(ok)
        
        alert.addTextField { (textField : UITextField) in
            textField.placeholder = "City Name"
            
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func setWeather(weather : Weather) {
        
        
        print("Set Weather")
        print("City:\(weather.cityName) temp:\(weather.temp) description:\(weather.description)")
        city_label.text = weather.cityName
        temp_label.text = "\(weather.temp)"
        description_label.text = weather.description
        cityButton.setTitle(weather.cityName, for: .normal)
        iconImage.image = UIImage(named: weather.icon)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.weatherService.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

