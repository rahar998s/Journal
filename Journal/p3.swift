//
//  p3.swift
//  Journal
//
//  Created by Rahaf ALDossari on 19/04/1446 AH.
//

import SwiftUI

struct p3: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack(spacing: 20) {
                    Button(action: {
                    }) {
                        Image("line")
                    }
                    Button(action: {
                    }) {
                        Image("plus")
                    }
                }
                .padding(.leading,290 )
                
                Text("Journal")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.trailing, 270)
            }
            .padding(.top,-364)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
               TextField("Search", text: .constant(""))
               .foregroundColor(.white)
              .padding(8)
       
                Image(systemName: "mic.fill")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
            }
            .background(Color(red: 0.125, green: 0.125, blue: 0.138))
            .cornerRadius(15)
            .padding(.top, -270)
            
            Spacer()
        }
    }
    }

#Preview {
    p3()
}

