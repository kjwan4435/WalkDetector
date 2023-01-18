//
//  walkDetector.swift
//  walkDetector
//
//  Created by Jiwan Kim on 2023/01/18.
//

import Foundation
import SwiftUI
import CoreMotion

let motionActivityManager = CMMotionActivityManager()


// The notification we'll send when a shake gesture happens.
extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

//  Override the default behavior of shake gestures to send our notification instead.
extension UIWindow {
     open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
     }
}

// A view modifier that detects shaking and calls a function of our choosing.
struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

// A View extension to make the modifier easier to use.
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}

func onMotion() -> Void {
    motionActivityManager.startActivityUpdates(to: OperationQueue.main) { (activity) in
       if (activity?.automotive)! {
           print("User using car")
       }
       if (activity?.cycling)! {
           print("User is cycling")
       }
       if (activity?.running)! {
           print("User is running")
       }
       if (activity?.walking)! {
           print("User is walking")
       }
       if (activity?.stationary)! {
           print("User is standing")
       }
       if (activity?.unknown)! {
           print("Unknown activity")
       }
    }
}
