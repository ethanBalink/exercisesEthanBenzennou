//
//  cellViewModel.swift
//  blogPostAppSwiftUI
//
//  Created by EthanBalink on 27/06/2023.
//


import Foundation
class CellViewModel {
    init(post:Post) {
        currentPost = post
    }
   private let currentPost: Post
    
    func getCellTitle() -> String {
        return currentPost.title
    }
    
    
}
