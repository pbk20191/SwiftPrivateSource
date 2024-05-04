//
//  File.swift
//  
//
//  Created by 박병관 on 1/1/24.
//

import Foundation
import UniformTypeIdentifiers
#if canImport(UIKit)
import UIKit
#endif
#if canImport(AppKit)
import AppKit
#endif

@available(iOS 16.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, macCatalyst 16.0, *)
@available(macOS, unavailable)
extension UTType {
    #if canImport(UIKit)
    ///com.apple.uikit.image
    static let uiImage:Self = {
        return NSItemProvider(object: UIImage()).registeredContentTypes.first!
    }()
    ///com.apple.uikit.color
    static let uiColor:Self = {
        return NSItemProvider(object: UIColor.clear).registeredContentTypes.first!
    }()
    //com.apple.uikit.attributedstring
    static let nsattributeString:Self = {
        return NSItemProvider(object: NSAttributedString(string: "")).registeredContentTypes.first!
    }()
    #endif
    #if os(iOS) || targetEnvironment(macCatalyst)
    /// com.apple.uikit.useractivity
    static let useractivity:Self = {
        return NSItemProvider(object: NSUserActivity(activityType: "com.example.null")).registeredContentTypes.first!
    }()
    #endif
//    UTType("com.apple.uikit.color"),
//    UTType("com.apple.uikit.useractivity"),
//    UTType("com.apple.uikit.image"),
//    UTType("com.apple.uikit.attributedstring")
}

@available(macOS 11.0, macCatalyst 14.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
extension UTType {
    
    @available(iOS 14.0, watchOS 7.0, *)
    static var colorPasteboard:Self {
        .init("com.apple.cocoa.pasteboard.color")!
    }
}


