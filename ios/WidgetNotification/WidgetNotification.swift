//
//  WidgetNotification.swift
//  WidgetNotification
//
//  Created by Hoa Phan on 30/09/2022.
//

import WidgetKit
import SwiftUI


@main
struct NotificationWidgets: WidgetBundle {
    var body: some Widget {

        if #available(iOS 16.1, *) {
          WidgetNotification()
        }
    }
}

struct LockScreenView: View {
  let context: ActivityViewContext<NotificationAttributes>
    var body: some View {
      VStack(alignment: .center) {
        ContentView(context: context)
        ActionButtontView()
      }.padding()
    }
}

struct ContentView: View {
  let context: ActivityViewContext<NotificationAttributes>
    var body: some View {
      VStack(alignment: .center) {
        Text(context.attributes.title)
          .foregroundColor(.white)
        Text(context.state.mesage)
          .foregroundColor(.white)
      }
    }
}

struct IconPlayView: View {
  var body: some View {
      HStack {
          Image(systemName: "play.square")
              .foregroundColor(.green)
      }
  }
}


struct IconCloseView: View {
  var body: some View {
      HStack(alignment: .center) {
          Image(systemName: "xmark.circle")
              .foregroundColor(.red)
      }
  }
}

struct IconNotifiyView: View {
  var body: some View {
      HStack(alignment: .center) {
          Image(systemName: "bell.badge")
              .foregroundColor(.red)
      }
  }
}

struct ActionButtontView: View {
  var body: some View {
    HStack{
      Button(action: {}) {
          HStack {
              Image(systemName: "play.square")
                  .foregroundColor(.white)
            Text("Subscrice").font(.caption)
              .bold()
          }
          .padding(EdgeInsets(top: 3, leading: 5, bottom: 3, trailing: 10))
          .background(.green)
          .clipShape(Capsule())
          .foregroundColor(.white)
      }
      Button(action: {}) {
          HStack {
              Image(systemName: "bell.badge")
                  .foregroundColor(.white)
            Text("Notification").font(.caption)
              .bold()
          }
          .padding(EdgeInsets(top: 3, leading: 5, bottom: 3, trailing: 10))
          .background(.red)
          .clipShape(Capsule())
          .foregroundColor(.white)
      }
    }
  }
}

struct WidgetNotification: Widget {

    var body: some WidgetConfiguration {
      ActivityConfiguration(for: NotificationAttributes.self) { context in
        // Create the view that appears on the Lock Screen and as a
        // banner on the Home Screen of devices that don't support the
        // Dynamic Island.
        LockScreenView(context: context)
      } dynamicIsland: { context in
        // Create the views that appear in the Dynamic Island.
        DynamicIsland {
          // Create the expanded view.
          DynamicIslandExpandedRegion(.leading) {
         
          }
          
          DynamicIslandExpandedRegion(.trailing) {
            IconCloseView()
          }
          
          DynamicIslandExpandedRegion(.center) {
            ContentView(context: context)
          }
          
          DynamicIslandExpandedRegion(.bottom) {
            ActionButtontView()
          }
        } compactLeading: {
          // Create the compact leading view.
          IconPlayView()
        } compactTrailing: {
          // Create the compact trailing view.
          IconNotifiyView()
        } minimal: {
          // Create the minimal view.
          IconPlayView()
        }
        .keylineTint(.yellow)
      }
    }
}

struct WidgetNotification_Previews: PreviewProvider {
    static var previews: some View {
      IconPlayView()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
