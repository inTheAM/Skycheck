//
//  WeatherIcons.swift
//  Skycheck
//
//  Created by Ahmed Mgua on 20/08/2021.
//

import Foundation

struct WeatherIcons	{
	static func icon(name: String, time: Date = Date(), sunrise:	Double, sunset: Double) ->	String	{
		let sunriseTime	=	Date(timeIntervalSince1970: sunrise)
		let sunsetTime = Date(timeIntervalSince1970: sunset)
		
		let sunriseTomorrow = sunriseTime.advanced(by: 86400)
		let sunsetTomorrow = sunsetTime.advanced(by: 86400)
		
		let todayCheck 		=	time	> sunriseTime && time < sunsetTime
		let tomorrowCheck 	=	time	> sunriseTomorrow && time < sunsetTomorrow
		
		let iconName = name.lowercased()
		
		if todayCheck ||	tomorrowCheck	{
			guard let icon = dayIcons[iconName] else	{
				return ""
			}
			return icon
		}	else	{
			guard let icon = nightIcons[iconName] else	{
				return ""
			}
			return icon
		}
	}
	
	static func iconNamed(_ name: String)	-> String	{
		let iconName = name.lowercased()
		guard let icon = dayIcons[iconName] else	{
			return ""
		}
		return icon
	}
	
	static let dayIcons	=	["clear sky": "sun.max.fill",
								 "few clouds": "cloud.sun.fill",
								 "scattered clouds": "cloud.sun.fill",
								 "broken clouds": "smoke.fill",
								 "overcast clouds": "smoke.fill",
								 
								 "light rain": "cloud.sun.rain.fill",
								 "light intensity shower rain": "cloud.sun.rain.fill",
								 "shower rain": "cloud.drizzle.fill",
								 "moderate rain": "cloud.drizzle.fill",
								 "heavy intensity rain": "cloud.rain.fill",
								 "heavy intensity shower rain": "cloud.rain.fill",
								 "ragged shower rain": "cloud.rain.fill",
								 "very heavy rain": "cloud.heavyrain.fill",
								 "extreme rain": "cloud.heavyrain.fill",
								 "freezing rain": "cloud.heavyrain.fill",
								 
								 "thunderstorm" : "cloud.bolt.fill",
								 "light thunderstorm" : "cloud.bolt.fill",
								 "heavy thunderstorm" : "cloud.bolt.fill",
								 "ragged thunderstorm" : "cloud.bolt.fill",
								 "thunderstorm with light drizzle" : "cloud.bolt.rain.fill",
								 "thunderstorm with light rain" : "cloud.bolt.rain.fill",
								 "thunderstorm with heavy rain" : "cloud.bolt.rain.fill",
								 "thunderstorm with heavy drizzle" : "cloud.bolt.rain.fill",
								 "thunderstorm with rain" : "cloud.bolt.rain.fill",
								 "thunderstorm with drizzle" : "cloud.bolt.rain.fill",
								 
								 "drizzle" : "cloud.drizzle.fill",
								 "light intensity drizzle" : "cloud.drizzle.fill",
								 "shower drizzle" : "cloud.drizzle.fill",
								 "drizzle rain" : "cloud.rain.fill",
								 "light intensity drizzle rain" : "cloud.rain.fill",
								 "shower rain and drizzle" : "cloud.rain.fill",
								 "heavy intensity drizzle" : "cloud.rain.fill",
								 "heavy shower rain and drizzle" : "cloud.heavyrain.fill",
								 "heavy intensity drizzle rain" : "cloud.heavyrain.fill",
								 
								 "light snow" : "snow",
								 "snow" : "snow",
								 "heavy snow" : "cloud.snow.fill",
								 "sleet" : "cloud.sleet.fill",
								 "light shower sleet" : "cloud.sleet.fill",
								 "shower sleet" : "cloud.sleet.fill",
								 "light rain and snow" : "cloud.sleet.fill",
								 "rain and snow" : "cloud.sleet.fill",
								 "light shower snow" : "cloud.sleet.fill",
								 "shower snow" : "cloud.sleet.fill",
								 "heavy shower snow" : "cloud.sleet.fill",
								 
								 "mist" : "cloud.fog.fill",
								 "smoke" : "smoke.fill",
								 "haze" : "sun.haze.fill",
								 "sand/ dust whirls" : "wind",
								 "fog" : "cloud.fog.fill",
								 "sand" : "wind",
								 "dust" : "wind",
								 "volcanic ash" : "wind",
								 "squalls" : "wind.snow",
								 "tornado" : "tornado",
	]
	static let nightIcons	=	["clear sky": "moon.stars.fill",
								   "few clouds": "cloud.moon.fill",
								   "scattered clouds": "cloud.moon.fill",
								   "broken clouds": "smoke.fill",
								   "overcast clouds": "smoke.fill",
								   
								   "light rain": "cloud.moon.rain.fill",
								   "light intensity shower rain": "cloud.moon.rain.fill",
								   "shower rain": "cloud.drizzle.fill",
								   "moderate rain": "cloud.drizzle.fill",
								   "heavy intensity rain": "cloud.rain.fill",
								   "heavy intensity shower rain": "cloud.rain.fill",
								   "ragged shower rain": "cloud.rain.fill",
								   "very heavy rain": "cloud.heavyrain.fill",
								   "extreme rain": "cloud.heavyrain.fill",
								   "freezing rain": "cloud.heavyrain.fill",
								   
								   "thunderstorm" : "cloud.bolt.fill",
								   "light thunderstorm" : "cloud.bolt.fill",
								   "heavy thunderstorm" : "cloud.bolt.fill",
								   "ragged thunderstorm" : "cloud.bolt.fill",
								   "thunderstorm with light drizzle" : "cloud.bolt.rain.fill",
								   "thunderstorm with light rain" : "cloud.bolt.rain.fill",
								   "thunderstorm with heavy rain" : "cloud.bolt.rain.fill",
								   "thunderstorm with heavy drizzle" : "cloud.bolt.rain.fill",
								   "thunderstorm with rain" : "cloud.bolt.rain.fill",
								   "thunderstorm with drizzle" : "cloud.bolt.rain.fill",
								   
								   "drizzle" : "cloud.drizzle.fill",
								   "light intensity drizzle" : "cloud.drizzle.fill",
								   "shower drizzle" : "cloud.drizzle.fill",
								   "drizzle rain" : "cloud.rain.fill",
								   "light intensity drizzle rain" : "cloud.rain.fill",
								   "shower rain and drizzle" : "cloud.rain.fill",
								   "heavy intensity drizzle" : "cloud.rain.fill",
								   "heavy shower rain and drizzle" : "cloud.heavyrain.fill",
								   "heavy intensity drizzle rain" : "cloud.heavyrain.fill",
								   
								   "light snow" : "snow",
								   "snow" : "snow",
								   "heavy snow" : "cloud.snow.fill",
								   "sleet" : "cloud.sleet.fill",
								   "light shower sleet" : "cloud.sleet.fill",
								   "shower sleet" : "cloud.sleet.fill",
								   "light rain and snow" : "cloud.sleet.fill",
								   "rain and snow" : "cloud.sleet.fill",
								   "light shower snow" : "cloud.sleet.fill",
								   "shower snow" : "cloud.sleet.fill",
								   "heavy shower snow" : "cloud.sleet.fill",
								   
								   "mist" : "cloud.fog.fill",
								   "smoke" : "smoke.fill",
								   "haze" : "sun.haze.fill",
								   "sand/ dust whirls" : "wind",
								   "fog" : "cloud.fog.fill",
								   "sand" : "wind",
								   "dust" : "wind",
								   "volcanic ash" : "wind",
								   "squalls" : "wind.snow",
								   "tornado" : "tornado",
	]
	
	
	
}

