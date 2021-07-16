//
//  View+.swift
//  
//
//  Created by DeShawn Jackson on 7/16/21.
//

import SwiftUI

extension View {
    
    public func navigationBar<NavigationBar: NavigationBarProtocol>(_ navigationBar: NavigationBar) -> some View {
        NavigationBarContentView(navigationBar: { navigationBar }, content: { self })
    }
}

extension View {
    /// Creates a NavigationLink to the destination
    public func destination<Destination: View>(@ViewBuilder _ destination: @escaping () -> Destination) -> some View {
        NavigationLink(
            destination: destination(),
            label: { self })
    }
    
    /// Creates a NavigationLink to the destination
    public func destination<Destination: View>(_ destination: Destination) -> some View {
        NavigationLink(
            destination: destination,
            label: { self })
    }
    
    /// Creates a NavigationLink to the destination
    public func destination<Value: Hashable, Destination: View>(tag: Value, selection: Binding<Value?>, destination: Destination) -> some View {
        NavigationLink(destination: destination, tag: tag, selection: selection, label: { self })
    }
    
    /// Creates a NavigationLink to the destination
    public func destination<Destination: View>(isActive: Binding<Bool>, destination: Destination) -> some View {
        NavigationLink(destination: destination, isActive: isActive, label: { self })
    }
}
