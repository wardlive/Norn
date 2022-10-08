//
//  WelcomeView.swift
//  Norn
//
//  Created by Pavel Neprin on 10/6/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 20) {
                Text("Welcome to the Norn")
                    .font(.largeTitle).bold()
                Text("Please share your location to get the weather in your area")
                    .font(.footnote)
                    .fontWeight(.light)
                    .lineLimit(2)
            }
            .padding()
            .padding(.vertical, 120)
            .multilineTextAlignment(.center)
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .labelStyle(.titleAndIcon)
            .cornerRadius(20)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .background(Color("Background"))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
