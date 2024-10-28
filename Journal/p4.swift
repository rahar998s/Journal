//
//  p4.swift
//  Journal
//
//  Created by Rahaf ALDossari on 19/04/1446 AH.
//

import SwiftUI

struct p4: View {
    @State private var Title = ""
    @State private var type = ""
    @FocusState private var focus: Bool
    var body: some View {
        ZStack{
            VStack{
                HStack(spacing: 300){
                    Button(action :{})
                    {
                        Text("cancel")
                        // .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(red: 0.643, green: 0.598, blue: 0.999, opacity: 1.0))
                        
                        // .padding(.trailing)
                    }
                    Button(action :{})
                    {
                        Text("Save")
                        // .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(red: 0.643, green: 0.598, blue: 0.999, opacity: 1.0))
                        
                        
                    }
                }
            
               
                    VStack{
                        
                        TextField("Title", text: $Title )
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading,7)
                            .onSubmit {
                                print(Title)
                            }
                            .focused($focus)
                        
                        
                        Text(Date().formatted(date:.numeric,time: .omitted))
                            .font(.caption)
                            .padding(.leading,-194)
                        
                        TextField("Type your Journal…", text: $type )
                            .foregroundColor(.white)
                            .font(.caption)
                        // .fontWeight(.bold)
                            .padding(.leading,7)
                        
                        
                    }
                    .onAppear()
                {
                    focus = true
                }
           
                
            }
            .padding(.top,-330)
        }
        }
    }



#Preview {
    p4()
}
