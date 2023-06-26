//
//  Model.swift
//  blog post app
//
//  Created by EthanBalink on 26/06/2023.
//

import Foundation

struct Post: Codable {
    let id:Int
    let title: String
    let body: String
}
