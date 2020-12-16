//
//  ContentView.swift
//  TodoApp
//
//  Created by Gabriel Akinyosoye on 12/16/20.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newTodo: String = ""
    @State var name: String = "Gabriel Akinyosoye"
    var searchBar: some View {
        HStack {
            TextField("Enter in a new task", text: self.$newTodo).autocapitalization(.words)
            Button(action: self.addTodo, label: {
                Text("Add Todo")
            })
        }
    }
    
    var footer: some View {
        HStack {
            Text("Developed by " + self.name)
            Image(systemName: "person")
        }
    }
    func addTodo() {
        
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), todoItem: newTodo))
        
        self.newTodo = ""
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar.padding()
                List(self.taskStore.tasks) { task in
                    Text(task.todoItem)
                }.navigationBarTitle("Tasks")
            }
        }
        footer.padding(.bottom, 4.0).font(Font.caption.weight(.light))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
