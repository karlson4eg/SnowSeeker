//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Evi St on 5/6/22.
//

import SwiftUI

struct ResortView: View {
    
    let resort: Resort
    
    @Environment(\.horizontalSizeClass) var sizeClass // normal iphone or big one
    @Environment(\.dynamicTypeSize) var typeSize // font size accessibility
    
    @EnvironmentObject var favourites: Favourites
    
    @State private var selectedFacility: Facility?
    @State private var showingFacility = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0){
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    if sizeClass == .compact && typeSize > .large  {
                        VStack(spacing: 10) { ResortDetailsView(resort: resort) }
                        VStack(spacing: 10) { SkiDetailsView(resort: resort) }
                    } else {
                        ResortDetailsView(resort: resort)
                        SkiDetailsView(resort: resort)
                    }
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge) //any size of text not larger xxxl
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            Button {
                                selectedFacility = facility
                                showingFacility = true
                            } label: {
                                facility.icon
                                    .font(.title)
                                    .accessibilityLabel(facility.name)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    
                    Button(favourites.contains(resort) ? "Remove from favourites" : "Add to Favourites") {
                        if favourites.contains(resort) {
                            favourites.remove(resort)
                        } else {
                            favourites.add(resort)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedFacility?.name ?? "More information", isPresented: $showingFacility, presenting: selectedFacility) { _ in
        } message : { facility in
            Text(facility.description)
        }
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ResortView(resort: Resort.example)
        }
        .environmentObject(Favourites())
    }
}
