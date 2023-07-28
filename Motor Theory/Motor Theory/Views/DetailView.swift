//
//  DetailView.swift
//  Motor Theory
//
//  Created by Avneet Sekhon on 2023-07-25.
//

import SwiftUI

struct DetailView: View {
    
    let makeModelString: String
    
    var body: some View {
        WebView(mmString: makeModelString).onAppear {
            print(makeModelString)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(makeModelString: "https://en.wikipedia.org/wiki/Main_Page")
    }
}


