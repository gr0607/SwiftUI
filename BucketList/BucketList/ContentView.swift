//
//  ContentView.swift
//  BucketList
//
//  Created by admin on 23.10.2023.
//

import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct ContentView: View {
    var loadingState = LoadingState.success
    
       var body: some View {
           if loadingState == .loading {
               LoadingView()
           } else if loadingState == .success {
               SuccessView()
           } else if loadingState == .failed {
               FailedView()
           }
       }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
