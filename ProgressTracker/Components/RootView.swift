import SwiftUI

public struct RootDelegate {
    var onApplicationDidAppear: (() -> Void)?
    var onApplicationWillEnterForeground: ((Notification) -> Void)?
    var onApplicationDidBecomeActive: ((Notification) -> Void)?
    var onApplicationWillResignActive: ((Notification) -> Void)?
    var onApplicationDidEnterBackground: ((Notification) -> Void)?
    var onApplicationWillTerminate: ((Notification) -> Void)?
    
    public init(
        onApplicationDidAppear: (() -> Void)? = nil,
        onApplicationWillEnterForeground: ((Notification) -> Void)? = nil,
        onApplicationDidBecomeActive: ((Notification) -> Void)? = nil,
        onApplicationWillResignActive: ((Notification) -> Void)? = nil,
        onApplicationDidEnterBackground: ((Notification) -> Void)? = nil,
        onApplicationWillTerminate: ((Notification) -> Void)? = nil
    ) {
        self.onApplicationDidAppear = onApplicationDidAppear
        self.onApplicationWillEnterForeground = onApplicationWillEnterForeground
        self.onApplicationDidBecomeActive = onApplicationDidBecomeActive
        self.onApplicationWillResignActive = onApplicationWillResignActive
        self.onApplicationDidEnterBackground = onApplicationDidEnterBackground
        self.onApplicationWillTerminate = onApplicationWillTerminate
    }
}

public struct RootView: View {
    
    let delegate: RootDelegate?
    let content: () -> any View
    
    public init(delegate: RootDelegate? = nil, content: @escaping () -> any View) {
        self.delegate = delegate
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            AnyView(content())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onFirstAppear {
            delegate?.onApplicationDidAppear?()
        }
        .onNotificationReceived(
            name: UIApplication.willEnterForegroundNotification,
            action: { notification in
                delegate?.onApplicationWillEnterForeground?(notification)
            }
        )
        .onNotificationReceived(
            name: UIApplication.didBecomeActiveNotification,
            action: { notification in
                delegate?.onApplicationDidBecomeActive?(notification)
            }
        )
        .onNotificationReceived(
            name: UIApplication.willResignActiveNotification,
            action: { notification in
                delegate?.onApplicationWillResignActive?(notification)
            }
        )
        .onNotificationReceived(
            name: UIApplication.didEnterBackgroundNotification,
            action: { notification in
                delegate?.onApplicationDidEnterBackground?(notification)
            }
        )
        .onNotificationReceived(
            name: UIApplication.willTerminateNotification,
            action: { notification in
                delegate?.onApplicationWillTerminate?(notification)
            }
        )
    }
}

#Preview("RootView") {
    ZStack {
        RootView(
            delegate: RootDelegate(
                onApplicationDidAppear: { },
                onApplicationWillEnterForeground: { _ in },
                onApplicationDidBecomeActive: { _ in },
                onApplicationWillResignActive: { _ in },
                onApplicationDidEnterBackground: { _ in },
                onApplicationWillTerminate: { _ in }
            ),
            content: {
                Text("Home")
            }
        )
        
        let delegate = RootDelegate(
            onApplicationDidAppear: nil,
            onApplicationWillEnterForeground: nil,
            onApplicationDidBecomeActive: nil,
            onApplicationWillResignActive: nil,
            onApplicationDidEnterBackground: nil,
            onApplicationWillTerminate: nil)
        
        RootView(
            delegate: delegate,
            content: {
                Text("Home")
            }
        )
    }
}
