//
//  Model.swift
//  blogPostAppSwiftUI
//
//  Created by EthanBalink on 27/06/2023.
//

import Foundation

struct Post: Codable, Identifiable {
    let id:Int
    let title: String
    let body: String
}
