//
//  DataStore.swift
//  TodoApp
//
//  Created by Gabriel Akinyosoye on 12/16/20.
//

import Foundation
import SwiftUI
import Combine

struct Task: Identifiable {
    var id = String()
    var todoItem = String()
}


class TaskStore: ObservableObject {
    @Published var tasks = [Task]()
}
