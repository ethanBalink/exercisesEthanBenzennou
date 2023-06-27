//
//  PostDetailView.swift
//  blogPostAppSwiftUI
//
//  Created by EthanBalink on 27/06/2023.
//

import SwiftUI

struct PostDetailView: View {
    @StateObject var MyPostDetailVM = PostVM()
    var post :Post
    var body: some View {
        VStack{
            Text("id:\(post.id)")
                .bold()
            Text("title: \(post.title)")
                .bold()
            List(MyPostDetailVM.commentsArr) { comment in
                Text("comment body: \(comment.body)")
                
            }
        }
        .onAppear {
            MyPostDetailVM.getCommentsFor(id:post.id)
            
        }
        
        
    }
    
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let a = Post(id: 5, title: "jj", body: "jjoi")
        PostDetailView(post: a)
    }
}
