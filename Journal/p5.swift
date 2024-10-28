//
//  p5.swift
//  Journal
//
//  Created by Rahaf ALDossari on 21/04/1446 AH.
//

import SwiftUI

struct p5: View {
    @State private var showSheet = false
    @State private var title = ""
    @State private var type = ""
    @FocusState private var focus: Bool
    @State private var actionMessage: String?
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("note")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding(.top, -120)

                Text("Begin Your Journal")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(red: 0.832, green: 0.783, blue: 0.996))
                    .padding(.bottom, 8)

                Text("Craft your personal diary, tap the \n plus icon to begin")
                    .font(.system(size: 16))
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
            }
            
            VStack {
                HStack(spacing: 20) {
                    Button(action: {
                        showSheet.toggle()
                    }) {
                        Image("plus")
                            .resizable()
                            .scaledToFit()
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                    }) {
                        Image("line")
                    }

                    Spacer()
                }
                .padding(.leading, 290)

                Text("Journal")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.trailing, 270)
            }
            .padding(.top, -364)

            .sheet(isPresented: $showSheet) {
                VStack {
                    HStack(spacing: 300) {
                        Button(action: {
                            actionMessage = "Cancelled"
                            showSheet = false // Dismiss the sheet
                        }) {
                            Text("Cancel")
                                .foregroundColor(Color(red: 0.643, green: 0.598, blue: 0.999, opacity: 1.0))
                        }

                        Button(action: {
                            if title.isEmpty || type.isEmpty {
                                actionMessage = "Please fill in all fields." // Show error message
                            } else {
                                actionMessage = "Saved: \(title)" // Display saved message
                            }
                            // Optionally dismiss the sheet
                        }) {
                            Text("Save")
                                .foregroundColor(Color(red: 0.643, green: 0.598, blue: 0.999, opacity: 1.0))
                        }
                    }
                    
                    VStack {
                        TextField("Title", text: $title)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading, 7)
                            .onSubmit {
                                print(title)
                            }
                            .focused($focus)

                        Text(Date().formatted(date: .numeric, time: .omitted))
                            .font(.caption)
                            .padding(.leading, -194)

                        TextField("Type your Journal…", text: $type)
                            .foregroundColor(.white)
                            .font(.caption)
                            .padding(.leading, 7)
                    }
                    
                   // Color.gray
                      //  .edgesIgnoringSafeArea(.all)
                    
                    .onAppear {
                        focus = true
                    }
                    
                    if let message = actionMessage {
                        Text(message)
                            .font(.headline)
                            .padding()
                            .foregroundColor(message.contains("Saved") ? .green : .red)
                    }
                }
                .padding(.top, -330)
            }
        }
    }
}


#Preview {
    p5()
}
