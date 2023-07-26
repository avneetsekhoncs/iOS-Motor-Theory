//
//  WebView.swift
//  Motor Theory
//
//  Created by Avneet Sekhon on 2023-07-25.
//

import Foundation
import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    
    let mmString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = mmString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
