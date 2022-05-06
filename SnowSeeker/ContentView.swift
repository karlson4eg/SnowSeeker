//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Evi St on 5/5/22.
//

import SwiftUI

extension View { // in case we want to override default iphone max layout
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @State private var searchText = ""
    @StateObject private var favourites = Favourites()
    
    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    self.resortLinkLabel(resort: resort)
                }
            }
            .navigationBarTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            
            WelcomeView()
        }
        .environmentObject(favourites) // all views get access to it
    }
    
    
    func resortLinkLabel(resort: Resort) -> some View {
        Group {
            HStack{
                Image(resort.country)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 25)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.black, lineWidth: 1)
                    )
                
                VStack(alignment: .leading) {
                    Text(resort.name)
                        .font(.headline)
                    Text("\(resort.runs) runs")
                        .foregroundColor(.secondary)
                }
                
                if favourites.contains(resort) {
                    Spacer()
                    Image(systemName: "heart.fill")
                        .accessibilityLabel("This is a favourite resort")
                        .foregroundColor(.red)
                }
            }
        }
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return resorts
        } else {
            return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
