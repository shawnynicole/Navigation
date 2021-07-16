//
//  NavigationBarContentView.swift
//  
//
//  Created by DeShawn Jackson on 7/16/21.
//

import SwiftUI
import AnchorView

internal struct NavigationBarContentView: View {
    
    public let content: AnchorView
    
    public init<NavigationBar: NavigationBarProtocol, Content: View>(
        @ViewBuilder navigationBar: @escaping () -> NavigationBar,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = AnchorView(anchorView: navigationBar, content: content)
    }
    
    public var body: some View {
        #if os(iOS)
        content
            .edgesIgnoringSafeArea(.top) //.edgesIgnoringSafeArea(.all)
            .navigationTitle("")
            .navigationBarHidden(true)
            //.navigationBarBackButtonHidden(true)
        #endif
        #if os(macOS)
        content
            .edgesIgnoringSafeArea(.top) //.edgesIgnoringSafeArea(.all)
            .navigationTitle("")
        #endif
    }
}
