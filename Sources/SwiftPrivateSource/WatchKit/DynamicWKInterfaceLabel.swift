//
//  File.swift
//  
//
//  Created by 박병관 on 5/5/24.
//

#if canImport(WatchKit)
import WatchKit

@available(watchOS 6.0, *)
final class DynamicWKInterfaceLabel: WKInterfaceLabel {
    
    static let install:() = {
        class_addProtocol(DynamicWKInterfaceLabel.self, WKInterfaceObjectDynamicCreatable())
    }()
    
    @objc var interfaceDescriptionForDynamicCreation:[String:String] {
        return [
            "type":"label",
            "property":interfaceProperty
        ]
    }
    
    static func new() -> WKInterfaceLabel {
        Self.install
        let allocation = Self.perform("alloc").takeUnretainedValue() as! NSObject
        let object = allocation.perform("_initForDynamicCreationWithInterfaceProperty:", with: "WKInterfaceLabel_" + UUID().uuidString).takeUnretainedValue() as! WKInterfaceLabel
        Unmanaged.passUnretained(object).release()
        return object
    }
    
}

#endif
