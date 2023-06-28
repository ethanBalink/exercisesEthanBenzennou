//
//  PostDetailView.swift
//  blogPostAppSwiftUI
//
//  Created by EthanBalink on 27/06/2023.
//

import SwiftUI

struct PostDetailView: View {
    
    @StateObject var myPostDetailVM = PostVM()
    
    var post :Post
    
    var body: some View {
        VStack {
            
            Text(post.title)
                .bold()
                .font(.title)
            Text("body: \(post.body)")
            Text("id:\(post.id)")
                .font(.footnote)
                .padding()
            List(myPostDetailVM.commentsArr) { comment in
                Text("comment body: \(comment.body)")
                    .font(.body)
                Text("commented by: \(comment.name)")
                
            }//.background(Color.blue)
            .ignoresSafeArea()
            .padding(.bottom, 10)
        }
        .onAppear {
            myPostDetailVM.getCommentsFor(id:post.id)
            
        }
        .listStyle(.grouped)
       
        
        
    }
    
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let a = Post(id: 5, title: "hello people", body: "this is a new post")
        PostDetailView(post: a)
    }
}
