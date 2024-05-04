//
//  File.swift
//  
//
//  Created by 박병관 on 5/5/24.
//
#if canImport(WatchKit)
import WatchKit

@available(watchOS 6.0, *)
final class DynamicWKInterfaceDate: WKInterfaceDate {
    
    static let install:() = {
        class_addProtocol(DynamicWKInterfaceDate.self, WKInterfaceObjectDynamicCreatable())
    }()
    
    @objc var interfaceDescriptionForDynamicCreation:[String:String] {
        return [
            "type":"date",
            "property":interfaceProperty
        ]
    }
    
    static func new() -> WKInterfaceDate {
        Self.install
        let allocation = Self.perform("alloc").takeUnretainedValue() as! NSObject
        let object = allocation.perform("_initForDynamicCreationWithInterfaceProperty:", with: "WKInterfaceDate_" + UUID().uuidString).takeUnretainedValue() as! WKInterfaceDate
        Unmanaged.passUnretained(object).release()
        return object
    }
    
}

#endif
