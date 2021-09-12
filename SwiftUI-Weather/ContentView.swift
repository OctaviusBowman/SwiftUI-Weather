//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Octavius Bowman on 9/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Miami, FL")
                
                MainWeatherStatusView(imageName: "cloud.rain.fill", temperature: 87)
                
                HStack(spacing: 15){
                    WeatherDayView(dayOfWeek: "MON", imageName: isNight ? "cloud.moon.rain.fill" : "cloud.bolt.rain.fill", temperature: 86)
                    WeatherDayView(dayOfWeek: "TUE", imageName: isNight ? "cloud.moon.rain.fill" : "cloud.bolt.rain.fill", temperature: 87 )
                    WeatherDayView(dayOfWeek: "WED", imageName: isNight ? "cloud.moon.rain.fill" : "cloud.bolt.rain.fill", temperature: 86 )
                    WeatherDayView(dayOfWeek: "THU", imageName: isNight ? "cloud.moon.rain.fill" : "cloud.bolt.rain.fill", temperature: 87 )
                    WeatherDayView(dayOfWeek: "FRI", imageName: isNight ? "cloud.moon.rain.fill" : "cloud.bolt.rain.fill", temperature: 87 )
                    WeatherDayView(dayOfWeek: "SAT", imageName: isNight ? "cloud.moon.rain.fill" : "cloud.bolt.rain.fill", temperature: 87 )
                }
                .padding()
                .background(Color.black.opacity(0.45))
                .cornerRadius(15)
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text("\(temperature)°")
                .font(.system(size: 70 ,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
