//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Evi St on 5/6/22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
        Text("Welcome to SnowSeeker!")
            .font(.largeTitle)
            
            Text("Please select a resort from the left-hand menu, swipe from the left side to show it <3")
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
