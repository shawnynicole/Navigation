# Navigation

**Navigation** makes ease of creating custom navigation bars anchored to the top, bottom, leading, and/or trailing sides of a view.

<p align="center">
<img src="../assets/screenshot1.png?raw=true" alt="Screenshot" width="300" />
<img src="../assets/screenshot2.png?raw=true" alt="Screenshot" width="300" />
<img src="../assets/screenshot3.png?raw=true" alt="Screenshot" width="300" />
</p>

<p align="center">
    <a href="#requirements">Requirements</a> • <a href="#usage">Usage</a> • <a href="#installation">Installation</a> • <a href="#author">Author</a> • <a href="#license-mit">License</a>
</p>

## Requirements

- iOS 14.0+
- Xcode 10.2+
- Swift 5.0+

## Usage

```swift

private struct FullyCustomNavigationBar: View {
    
    var body: some View {
        contentViewA
    }
    
    var contentViewA: some View {
      Content(title: "ContentViewA", destination: contentViewB)
        .navigationBar(NavigationBarLarge(title: "ContentViewA"))
        .navigationBar(NavigationBarInline(title: "ContentViewA", anchor: .bottom))
        .navigationBar(NavigationBarVertical(anchor: .leading))
    }
    
    var contentViewB: some View {
      Content(title: "ContentViewB", destination: contentViewC)
        .navigationBar(NavigationBarInline(title: "ContentViewB"))
    }
    
    var contentViewC: some View {
      Content(title: "ContentViewC")
        .navigationBar(NavigationBarLarge(title: "ContentViewC"))
        .navigationBar(NavigationBarVertical(anchor: .trailing))
    }
}

private struct Content: View {
    
    let title: String
    let destination: AnyView?
    
    init(title: String) {
        self.title = title
        self.destination = nil
    }
    
    init<Destination: View>(title: String, destination: Destination) {
        self.title = title
        self.destination = AnyView(destination)
    }
    
    var body: some View {
        if let destination = destination {
            label
                .destination(destination)
        } else {
            label
        }
    }
    
    var label: some View {
        Text(title)
            .padding()
    }
}

private struct NavigationBarVertical: NavigationBarProtocol {
            
    var anchor: NavigationBarAnchor
    
    var body: some View {
        AnchorViewSample(orientation: .vertical, anchor: anchor)
    }
}

private struct NavigationBarLarge: NavigationBarProtocol {
    
    @Environment(\.presentationMode) var presentationMode
    
    let title: String
    
    var anchor: NavigationBarAnchor = .top
    
    var body: some View {
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            HStack {
                Spacer()
                Button(systemName: "xmark", action: { presentationMode.wrappedValue.dismiss() })
                Spacer()
                Text("NavigationBarLarge - \(title)")
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .frame(height: 116)
    }
}

private struct NavigationBarInline: NavigationBarProtocol {
        
    @Environment(\.presentationMode) var presentationMode

    let title: String
    
    var anchor: NavigationBarAnchor = .top
    
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
            HStack {
                Spacer()
                Button(systemName: "xmark", action: { presentationMode.wrappedValue.dismiss() })
                Spacer()
                Text("NavigationBarInline - \(title)")
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .frame(height: 64)
    }
}

public typealias NavigationBarAnchor = Anchor

public protocol NavigationBarProtocol: AnchorViewProtocol { }

extension View {
    
    public func navigationBar<NavigationBar: NavigationBarProtocol>(_ navigationBar: NavigationBar) -> some View {
        NavigationBarContentView(navigationBar: { navigationBar }, content: { self })
    }
}

public struct NavigationBarContentView: View {
    
    public let content: AnchorView
    
    public init<NavigationBar: NavigationBarProtocol, Content: View>(
        @ViewBuilder navigationBar: @escaping () -> NavigationBar,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = AnchorView(anchorView: navigationBar, content: content)
    }
    
    public var body: some View {
        content
            .edgesIgnoringSafeArea(.top)
            .navigationTitle("")
            .navigationBarHidden(true)
    }
}

```

## Installation

#### Swift Package Manager
You can use [The Swift Package Manager](https://swift.org/package-manager) to install `Navigation` by adding the proper description to your `Package.swift` file:
```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .package(url: "https://github.com/shawnynicole/Navigation.git", from: "1.0.0")
    ]
)
```
For more information on [Swift Package Manager](https://swift.org/package-manager), checkout its [GitHub Page](https://github.com/apple/swift-package-manager).

#### Manually

[Download](https://github.com/shawnynicole/Navigation/archive/master.zip) the project and copy the `Navigation` folder into your project to use it in.

## Author

shawnynicole

## License (MIT)

**Navigation** is available under the MIT license. See the LICENSE file for more info.
