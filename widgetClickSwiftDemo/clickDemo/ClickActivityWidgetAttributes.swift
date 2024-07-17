//
//  ClickActivityWidgetAttributes.swift
//  widgetClickDemo
//
//  Created by sunyc on 2024/7/17.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ClickActivityWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var clickTitle : String
    }
    var name: String
}

