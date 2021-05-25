import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "Publisher") {
    let myNotification = Notification.Name("MyNotification")
    
    let publisher = NotificationCenter.default.publisher(for: myNotification, object: nil)
    
    let center = NotificationCenter.default
    
    let observer = center.addObserver(
        forName: myNotification,
        object: nil,
        queue: nil
    ) { (notification) in
        print("Notification Received")
    }
    
    center.post(name: myNotification, object: nil)
    
    center.removeObserver(observer)
}

example(of: "Subscriber") {
    let myNotification = Notification.Name("MyNotification")
    
    let publisher = NotificationCenter.default.publisher(for: myNotification, object: nil)
    
    let center = NotificationCenter.default
    
    let subscription = publisher.sink { _ in
        print("Notification received from a publisher!")
    }
    
    center.post(name: myNotification, object: nil)
    
    subscription.cancel()
}
example(of: "Just") {
    let just = Just("Hello world!")
    
    _ = just.sink(receiveCompletion: {
        print("Received Completion", $0)
    }, receiveValue: {
        print("Received value", $0)
    })
}

example(of: "assign(to:on:)") {
    
    class SomeObject {
        var value: String = "" {
            didSet {
                print(value)
            }
        }
    }
    
    let object = SomeObject()
    
    let publisher = ["Hello", "world!"].publisher
    
    _ = publisher
        .assign(to: \.value, on: object)
}

example(of: "assign(to:)") {
    class SomeObject {
        @Published var value = 0
    }
    
    let object = SomeObject()
    
    object.$value.sink {
        print($0)
    }
    
    (0..<10).publisher
        .assign(to: &object.$value)
}
