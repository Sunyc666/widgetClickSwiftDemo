//
//  clickDemoBundle.swift
//  clickDemo
//
//  Created by sunyc on 2024/7/17.
//

import WidgetKit
import SwiftUI

@main
struct clickDemoBundle: WidgetBundle {
    var body: some Widget {
        if #available(iOS 16.1, *) {
            clickDemoLiveActivity()
        }
    }
}
