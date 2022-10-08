//
//  WeatherRow.swift
//  Norn
//
//  Created by Pavel Neprin on 10/7/22.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack {
            Image(systemName: logo)
                .font(.title)
                .frame(width: 25, height: 25)
                .padding()
                .background(Color("Background"))
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .font(.title).bold()
            }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "Feels like", value: "8°")
    }
}
