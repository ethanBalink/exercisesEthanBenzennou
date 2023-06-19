//
//  todoItem.swift
//  todoList
//
//  Created by EthanBalink on 19/06/2023.
//

import Foundation

struct todoData : Codable {
    var titleArr = ["hi","hello","hey","jo","jt", "ofldx"]
}
let encoder = JSONEncoder()
//if let encoded = try? encoder.encode
// code of video

// setjey when user gives input
//UserDefaults.standard.setValue("textfield", forKey: "newTodo")
// retrieve data
//UserDefaults.standard.array(forKey: "newTodo")
