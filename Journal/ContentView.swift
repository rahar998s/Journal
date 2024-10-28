//
//  ContentView.swift
//  Journal
//
//  Created by Rahaf ALDossari on 19/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var navigateToP22 = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(.black).edgesIgnoringSafeArea(.all)
                Image("note")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding(.top, -120)

                VStack {
                    Text("Journali")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.top, 33)

                    Text("Your thoughts, your story")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.top, 99)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    navigateToP22 = true
                }
            }
            .background(
                NavigationLink(destination: p22(), isActive: $navigateToP22)
                   {
                    EmptyView()
                }
            )
            .navigationBarBackButtonHidden(true)
        }
    }
}


#Preview {
    ContentView()
}
