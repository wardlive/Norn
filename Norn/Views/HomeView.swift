//
//  HomeView.swift
//  Norn
//
//  Created by Pavel Neprin on 10/7/22.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83 // 702/844
    case middle = 0.385 // 325/844
}

struct HomeView: View {
    var weather: ResponseBody
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    @State var hasDragged: Bool = false
    
    var bottomSheetTranslationProrated: CGFloat {
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) / (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geometry in
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
                let imageOffset = screenHeight + 36
                
                
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
                            Spacer()
                            .frame(height: 0)
                            
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
                    
                    //                VStack {
                    //                    Spacer()
                    //                    VStack(alignment: .leading, spacing: 20) {
                    //                        Text("Weather now")
                    //                            .bold().padding(.bottom)
                    //
                    //                        HStack {
                    //                            WeatherRow(logo: "thermometer.snowflake", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                    //
                    //                            Spacer()
                    //
                    //                            WeatherRow(logo: "thermometer.sun", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    //                        }
                    //
                    //                        HStack {
                    //                            WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                    //
                    //                            Spacer()
                    //
                    //                            WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                    //                        }
                    //                    }
                    //                    .frame(maxWidth: .infinity, alignment: .leading)
                    //                    .padding()
                    //                    .padding(.bottom, 85)
                    //                    .background(Color("RowColor"))
                    //                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    //                }
                    
                    // MARK: Bottom Sheet
                    BottomSheetView(position: $bottomSheetPosition) {
//                        Text(bottomSheetTranslationProrated.formatted())
                    } content: {
                        ForecastView(bottomSheetTranslationProrated: bottomSheetTranslationProrated)
                    }
                    .onBottomSheetDrag { translation in
                        bottomSheetTranslation = translation / screenHeight
                        
                        withAnimation(.easeInOut) {
                            if bottomSheetPosition == BottomSheetPosition.top {
                                hasDragged = true
                            } else {
                                hasDragged = false
                            }
                        }
                    }
                    
                    //MARK: - TabBar
                    TabBar(action: {
                        bottomSheetPosition = .top
                    })
                    .offset(y: bottomSheetTranslationProrated * 115)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                }
                .edgesIgnoringSafeArea(.bottom)
                .foregroundColor(Color("AccentColor"))
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(weather: previewWeather)
    }
}
