//
//  p2.swift
//  Journal
//
//  Created by Rahaf ALDossari on 19/04/1446 AH.
//


import SwiftUI

struct p2: View {
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
            
            VStack {
      Image("note")
                                       
                           
         .imageScale(.large)
          .foregroundStyle(.tint)
        .padding(.top,-120)
      
                                       
      Text("Begin Your Journal")
         .font(.system(size: 20, weight: .bold))
         .foregroundColor(Color(red: 0.832, green: 0.783, blue: 0.996))
                 .padding(.bottom, 8)
                                       
         Text("Craft your personal diary, tap the plus icon to begin")
                 .font(.system(size: 16))
          .foregroundColor(Color.gray)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 32)
                                   }
            }
        }
    }

    

#Preview {
    p2()
}
