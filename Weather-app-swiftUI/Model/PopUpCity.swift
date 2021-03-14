//
//  PopUpCity.swift
//  Weather-app-swiftUI
//
//  Created by Naomi Duclaux on 14/03/2021.
//

import Foundation
import SwiftUI

struct PopUpCity: View {
//    @State var city: String
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                Text("Choisir une nouvelle ville")
                    .font(.largeTitle)
                    .background(Color.black)
                    .foregroundColor(.white)
    //            TextField("Ville", text: $city)
                HStack{
                    Button {
                        ContentView.showPopUp = false
                    } label: {
                        Text("Annuler")
                            .frame(width: 300, height: 50)
                            .background(Color.red)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .cornerRadius(4)
                    }.padding(.bottom, 10)
                    
                    Button {
                        
                    } label: {
                        Text("Ok")
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .cornerRadius(4)
                    }.padding(.bottom, 10)
                }
            }
        }
    }
}
