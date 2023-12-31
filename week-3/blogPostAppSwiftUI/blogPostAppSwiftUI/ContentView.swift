//
//  ContentView.swift
//  blogPostAppSwiftUI
//
//  Created by EthanBalink on 27/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var myViewModel = ViewModel()
    var body: some View {
        NavigationView {
            List(myViewModel.postsArr) { post in
                
                NavigationLink(
                    destination: PostDetailView(post: post),
                    label: {
                        VStack(spacing: 15) {
                            
                            Text("\(post.title)")
                        }
                        
                    })
                
                // .frame(height: ) make list furhter from safeArea
            }
            .onAppear {
                myViewModel.getPostsArrDataFromServices()
            }
            .padding(.top,15)
            .navigationTitle("Posts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
