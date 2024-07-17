//
//  AppDelegate.swift
//  widgetClickSwiftDemo
//
//  Created by sunyc on 2024/7/17.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.absoluteString == "LiveActivity/Call" {
            self.showToast(message: "Your click Call")
        } else if url.absoluteString == "LiveActivity/Vib" {
            self.showToast(message: "Your click Vib")
        } else if url.absoluteString == "LiveActivity/Ring" {
            self.showToast(message: "Your click Ring")
        }
        return true
    }
}


extension NSObject {
    func showToast(message: String, duration: Double = 2.0) {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return
        }
        
        for item in keyWindow.subviews {
            if item.tag == 9990 {
                item.removeFromSuperview()
            }
        }
        
        let toastLabel = UILabel(frame: CGRect(x: keyWindow.frame.size.width  * 0.5 - 115,
                                               y: keyWindow.frame.size.height * 0.5 - 100,
                                               width: 230,
                                               height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.tag  = 9990
        toastLabel.font = UIFont.systemFont(ofSize: 14)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        keyWindow.addSubview(toastLabel)

        UIView.animate(withDuration: 0.5, delay: duration, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }
}
