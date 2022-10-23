//
//  HomeView.swift
//  Norn
//
//  Created by Pavel Neprin on 10/7/22.
//

import SwiftUI

struct HomeView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            //MARK: - Background Color
            Color("Background").ignoresSafeArea()
            
            VStack() {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .font(.largeTitle).bold()
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
//                            Image(systemName: "\(weather.weather[5].conditionName)")
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            
                            Text("\(weather.weather[0].main)")
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.semibold)
                            .padding()
                    }
                    
                    //Spacer()
                     //.frame(height: 0)
                    
                    //MARK: - City Image
                    Image("City")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                
                 Spacer()
                
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Weather now")
                            .bold().padding(.bottom)
                        
                        HStack {
                            WeatherRow(logo: "thermometer.snowflake", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                            
                            Spacer()
                            
                            WeatherRow(logo: "thermometer.sun", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                        }
                        
                        HStack {
                            WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                            
                            Spacer()
                            
                            WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 85)
                    .background(Color("RowColor"))
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                }
                 TabBar(action: {})
                    .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
        .foregroundColor(Color("AccentColor"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(weather: previewWeather)
    }
}
