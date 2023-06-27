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
        List(myViewModel.postsArr) { post in

            VStack(spacing: 15) {
                
                Text("\(post.title)")
            }
            
            .padding()
        }
        .onAppear {
            myViewModel.getPostsArrDataFromServices()
        }
       // .frame(height: ) make list furhter from safeArea
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
