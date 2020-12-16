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
    
    var searchBar: some View {
        HStack {
            TextField("Enter in a new task", text: self.$newTodo)
            Button(action: self.addTodo, label: {
                Text("Add Todo")
            })
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
