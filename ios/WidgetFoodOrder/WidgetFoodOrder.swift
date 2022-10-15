//
//  WidgetFoodOrder.swift
//  WidgetFoodOrder
//
//  Created by Hoa Phan on 12/10/2022.
//

import WidgetKit
import SwiftUI


@main
struct FoodOrderWidgets: WidgetBundle {
  var body: some Widget {
    if #available(iOS 16.1, *) {
      WidgetFoodOrder()
    }
  }
}

struct LockScreenView: View {
  let context: ActivityViewContext<FoodOrderAttributes>
  var body: some View {
    VStack(alignment: .center) {
      ContentView(context: context)
      ActionButtontView()
    }.padding()
  }
}

struct ContentView: View {
  let context: ActivityViewContext<FoodOrderAttributes>
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(context.attributes.title)
        .foregroundColor(.white)
        .font(.headline)
      Text(context.state.mesage)
        .foregroundColor(.white)
        .font(.caption)
    }
  }
}

struct IconPlayView: View {
  var body: some View {
    HStack {
      Image(systemName: "cart")
        .foregroundColor(.green)
    }
  }
}

struct IconNotifiyView: View {
  var body: some View {
    HStack(alignment: .center) {
      Image(systemName: "xmark.bin")
        .foregroundColor(.red)
    }
  }
}

struct ActionButtontView: View {
  var body: some View {
    VStack{
      Link(destination: URL(string: "dynamicisland://cancel")!, label: {
        HStack {
          Image(systemName: "xmark.bin")
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        }
        .background(.red)
        .clipShape(Capsule())
      })
      
      Link(destination: URL(string: "dynamicisland://order")!, label: {
        HStack {
          Image(systemName: "cart")
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        }
        .background(.green)
        .clipShape(Capsule())
      })
    }
  }
}

struct CompactLeadingView: View {
  let context: ActivityViewContext<FoodOrderAttributes>
  
  var body: some View {
    HStack () {
      NetworkImage(url: URL(string: context.attributes.image))
        .frame(width: 30, height: 30)
        .cornerRadius(30)
      Text(context.attributes.title)
        .foregroundColor(.white)
        .font(.caption2)
    }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
  }
}

struct CompactTrailingView: View {
  var body: some View {
    HStack{
      Link(destination: URL(string: "dynamicisland://order")!, label: {
        HStack {
          Image(systemName: "cart")
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        }
        .background(.green)
        .clipShape(Capsule())
      })
      
      Link(destination: URL(string: "dynamicisland://cancel")!, label: {
        HStack {
          Image(systemName: "xmark.bin")
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        }
        .background(.red)
        .clipShape(Capsule())
      })
    }
  }
}

struct MinimalView: View {
  let context: ActivityViewContext<FoodOrderAttributes>
  var body: some View {
    NetworkImage(url: URL(string: context.attributes.image))
      .frame(width: 30, height: 30)
      .cornerRadius(30)
  }
}

struct LeadingView: View {
  let context: ActivityViewContext<FoodOrderAttributes>
  var body: some View {
    NetworkImage(url: URL(string: context.attributes.image))
      .frame(width: 90, height: 90)
      .cornerRadius(16)
  }
}

struct NetworkImage: View {
  let url: URL?
  
  var body: some View {
    Group {
      if let url = url, let imageData = try? Data(contentsOf: url),
         let uiImage = UIImage(data: imageData) {
        
        Image(uiImage: uiImage)
          .resizable()
          .aspectRatio(contentMode: .fit)
      }
      else {
        Image("placeholder-image")
      }
    }
  }
}

struct WidgetFoodOrder: Widget {
  
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: FoodOrderAttributes.self) { context in
      // Create the view that appears on the Lock Screen and as a
      // banner on the Home Screen of devices that don't support the
      // Dynamic Island.
      LockScreenView(context: context)
    } dynamicIsland: { context in
      // Create the views that appear in the Dynamic Island.
      DynamicIsland {
        // Create the expanded view.
        DynamicIslandExpandedRegion(.leading) {
          LeadingView(context: context)
          
        }
        DynamicIslandExpandedRegion(.trailing) {
          ActionButtontView()
        }
        DynamicIslandExpandedRegion(.center) {
          ContentView(context: context)
        }
      } compactLeading: {
        // Create the compact leading view.
        CompactLeadingView(context: context)
      } compactTrailing: {
        // Create the compact trailing view.
        CompactTrailingView()
      } minimal: {
        // Create the minimal view.
        MinimalView(context: context)
      }
      .keylineTint(.yellow)
    }
  }
}

struct WidgetFoodOrder_Previews: PreviewProvider {
  static var previews: some View {
    IconPlayView()
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
