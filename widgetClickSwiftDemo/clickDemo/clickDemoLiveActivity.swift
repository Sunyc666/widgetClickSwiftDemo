//
//  clickDemoLiveActivity.swift
//  clickDemo
//
//  Created by sunyc on 2024/7/17.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct clickDemoLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ClickActivityWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                TKTActivityWidgetMainView(context: context)
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.clickTitle)")
                    // more content
                }
            } compactLeading: {
                Text("Left")
            } compactTrailing: {
                Text("Right")
            } minimal: {
                Text("M")
            }
            .keylineTint(Color.red)
        }
    }
}

struct TKTActivityWidgetMainView : View {
    let context: ActivityViewContext<ClickActivityWidgetAttributes>
    var body: some View {
        HStack(spacing: 20){
            Spacer()
            Link(destination: URL(string: "LiveActivity/Ring")!) {
                Text("Ring")
            }
            .frame(width: 45,height: 45)
            .background(Color.red)
            .clipShape(Circle())
            Spacer()
            Link(destination: URL(string: "LiveActivity/Vib")!) {
                Text("Vib")
            }
            .frame(width: 45,height: 45)
            .background(Color.green)
            .clipShape(Circle())
            Spacer()
            Link(destination: URL(string: "LiveActivity/Call")!) {
                Text("Call")
            }
            .frame(width: 45,height: 45)
            .background(Color.blue)
            .clipShape(Circle())
            Spacer()
        }
        .frame(height: 45)
    }
}

extension ClickActivityWidgetAttributes {
    fileprivate static var preview: ClickActivityWidgetAttributes {
        ClickActivityWidgetAttributes(name: "ClickDemo")
    }
}

extension ClickActivityWidgetAttributes.ContentState {
    fileprivate static var smiley: ClickActivityWidgetAttributes.ContentState {
        ClickActivityWidgetAttributes.ContentState(clickTitle: "Click Here")
    }
}

#Preview("Notification", as: .content, using: ClickActivityWidgetAttributes.preview) {
   clickDemoLiveActivity()
} contentStates: {
    ClickActivityWidgetAttributes.ContentState.smiley
}
