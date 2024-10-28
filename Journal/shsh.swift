import SwiftUI

struct shsh: View {
    @State private var showSheet = false
    @State private var Title = ""
    @State private var type = ""
    @FocusState private var focus: Bool
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
      Image("note")

                           
         .imageScale(.large)
          .foregroundStyle(.tint)
        .padding(.top,-120)
      
                                       
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
                
                HStack(spacing: 20){
                    // Button with an image
                    Button(action: {
                        showSheet.toggle() // Show the sheet when tapped
                    }) {
                        Image( "plus")
                            .resizable()
                            .scaledToFit()
                          //  .frame(width: 50, height: 50)
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                    }) {
                        Image("line")
                    }
                    
                    Spacer()
                    
                }
                .padding(.leading,290 )
                
                Text("Journal")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.trailing, 270)
                
            }
            .padding(.top,-364)
            
            .sheet(isPresented: $showSheet) {
                
             //   SheetView()
                
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
    }





#Preview {
    shsh()
}
