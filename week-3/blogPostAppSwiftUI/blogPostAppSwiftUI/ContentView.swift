//
//  ContentView.swift
//  blogPostAppSwiftUI
//
//  Created by EthanBalink on 27/06/2023.
//

import SwiftUI
let myViewModel = ViewModel()
 
struct ContentView: View {
    @State  var postArrCount:Int = 1
    var body: some View {
        List(0..<postArrCount, id: \.self) { item in
            VStack(spacing: 15) {
            
              
                Text("Hello, world!")
            }
            .onAppear {
                myViewModel.getPostsArrDataFromServices() { success, error in
                    if success {
                        print(myViewModel.getTableCount())
                       postArrCount =  myViewModel.getTableCount()
//                        DispatchQueue.main.async {
//                            self.tableView.reloadData()
//                        }
                        // RELOADDATA
                        print("succes")
                    }
                    else {
                    
                        print("mistake")
                    }
                }
            }
            .padding()
        }
    }
}

//Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
//    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
