//
//  PostDetailView.swift
//  blogPostAppSwiftUI
//
//  Created by EthanBalink on 27/06/2023.
//

import SwiftUI

struct PostDetailView: View {
    var post :Post
    var body: some View {
        VStack{
            Text("id:\(post.id)")
                .bold()
            Text("title: \(post.title)")
                .bold()
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let a = Post(id: 5, title: "jj", body: "jjoi")
        PostDetailView(post: a)
    }
}
