import SwiftUI

struct Note: Identifiable {
    let id = UUID()
    var title: String
    var content: String
    var isBookmarked: Bool = false
    var isSaved: Bool = false
}

struct p22: View {
    @State private var showSheet = false
    @State private var title = ""
    @State private var content = ""
    @FocusState private var focus: Bool
    @State private var actionMessage: String?
    @State private var notes: [Note] = []
    @State private var hasNotes = false
    @State private var editingNote: Note?
    @State private var searchText = ""
    
    var filteredNotes: [Note] {
        if searchText.isEmpty {
            return notes
        } else {
            return notes.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.content.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                HStack(spacing: 20) {
                    Button(action: {
                        showSheet.toggle()
                    }) {
                        Image("plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {}) {
                        Image("line")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                    
                    Spacer()
                }
                .padding(.top, -750)
                .padding(.leading, 290)
                
                Text("Journal")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.trailing, 270)
                    .padding(.top, -730)
            }
            
            VStack {
                if !hasNotes {
                    Image("note")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.tint)
                        .padding(.top, -120)
                    
                    Text("Begin Your Journal")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color.purpli)
                        .padding(.bottom, 8)
                    
                    Text("Craft your personal diary, tap the \n plus icon to begin")
                        .font(.system(size: 16))
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                } else {
                    searchBar
                    notesList
                }
            }
            .padding(.top, -20)
            .sheet(isPresented: $showSheet) {
                noteEditorSheet
            }
        }
    }
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 8)
            TextField("Search", text: $searchText)
                .foregroundColor(.white)
                .padding(8)
            Image(systemName: "mic.fill")
                .foregroundColor(.gray)
                .padding(.trailing, 8)
        }
        .background(Color(red: 0.125, green: 0.125, blue: 0.138))
        .cornerRadius(15)
        .padding(.horizontal, 10)
        .padding(.top, 120)
    }
    
    private var notesList: some View {
        List {
            ForEach(filteredNotes) { note in
                noteCell(note)
            }
        }
       // .padding(.horizontal, 10)
        .padding(.top,10)
       // .frame(maxHeight: 750)
        .background(Color.black)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        
    }
    
    private func noteCell(_ note: Note) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(note.title)
                    .font(.title2)
                    .foregroundColor(Color(red: 0.832, green: 0.783, blue: 0.996))
                    .padding(.bottom, 4)
                
                Spacer()
                
                bookmarkButton(for: note)
            }
            
            Text(note.content)
                .font(.body)
                .foregroundColor(.gray)
                .lineLimit(3)
                .padding(.bottom, 4)
        }
        .padding()
        .frame(width: 380, height: 130)
        .background(Color.blacko)
        .cornerRadius(10)
  
        
        
     
        
        
        .swipeActions(edge: .leading) {
            editButton(for: note)
        }
        .swipeActions(edge: .trailing) {
            deleteButton(for: note)
        }
    }
    
    private func bookmarkButton(for note: Note) -> some View {
        Button(action: {
            if let index = notes.firstIndex(where: { $0.id == note.id }) {
                notes[index].isBookmarked.toggle()
            }
        }) {
            Image(systemName: note.isBookmarked ? "bookmark.fill" : "bookmark")
                .foregroundColor(note.isBookmarked ? Color(red: 0.832, green: 0.783, blue: 0.996) : .gray)
        }
        .padding(.trailing, -2)
        .padding(.top, 28)
    }
    
    private func editButton(for note: Note) -> some View {
        Button(action: {
            editingNote = note
            title = note.title
            content = note.content
            showSheet.toggle()
        }) {
            Image("pen")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
        }
        .tint(Color(red: 0.488, green: 0.498, blue: 0.988))
    }
    
    private func deleteButton(for note: Note) -> some View {
        Button(role: .destructive) {
            if let index = notes.firstIndex(where: { $0.id == note.id }) {
                deleteNoteAt(index)
            }
        } label: {
            Label("Delete", systemImage: "trash")
        }
    }
    
    private var noteEditorSheet: some View {
        VStack {
            sheetHeader
            
            VStack {
                TextField("Title", text: $title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, -30)
                    .padding()
                    .focused($focus)
                
                Text(Date().formatted(date: .numeric, time: .omitted))
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.leading, -193)
                
                TextField("Type your Journal…", text: $content)
                    .foregroundColor(.white)
                    .font(.body)
                    .padding(.leading, -30)
                    .padding()
            }
            .padding()
            Color.black.edgesIgnoringSafeArea(.all)
            
            if let message = actionMessage {
                Text(message)
                    .font(.headline)
                    .padding()
                    .foregroundColor(message.contains("Saved") || message.contains("Updated") ? .green : .red)
            }
        }
        .background(Color.black)
        .foregroundColor(.white)
        .ignoresSafeArea()
        .onAppear { focus = true }
    }
    
    private var sheetHeader: some View {
        HStack {
            Button(action: {
                actionMessage = "Cancelled"
                showSheet = false
            }) {
                Text("Cancel")
                    .foregroundColor(Color(red: 0.643, green: 0.598, blue: 0.999))
            }
            
            Spacer()
            
            Button(action: saveNote) {
                Text("Save")
                    .foregroundColor(Color(red: 0.643, green: 0.598, blue: 0.999))
            }
        }
        .padding()
    }
    
    private func saveNote() {
        if title.isEmpty || content.isEmpty {
            actionMessage = "Please fill in all fields."
        } else {
            if let editingNote = editingNote {
                if let index = notes.firstIndex(where: { $0.id == editingNote.id }) {
                    notes[index].title = title
                    notes[index].content = content
                    notes[index].isSaved = true
                    actionMessage = "Updated: \(title)"
                }
            } else {
                let newNote = Note(title: title, content: content, isSaved: true)
                notes.append(newNote)
                actionMessage = "Saved: \(title)"
            }
            hasNotes = !notes.isEmpty
            title = ""
            content = ""
            editingNote = nil
            showSheet = false
        }
    }
    
    private func deleteNoteAt(_ index: Int) {
        notes.remove(at: index)
        hasNotes = !notes.isEmpty
    }
}

#Preview {
    p22()
}
