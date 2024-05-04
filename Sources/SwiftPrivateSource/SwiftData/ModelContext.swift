//
//  File.swift
//  
//
//  Created by 박병관 on 5/5/24.
//

#if canImport(SwiftData)
import SwiftData
import CoreData

@available(macOS 14, iOS 17.0, tvOS 17.0, macCatalyst 17.0, watchOS 10.0, visionOS 1.0, *)
extension ModelContext {
    var _nsContext:NSManagedObjectContext {
        Mirror(reflecting: self).descendant(#function) as! NSManagedObjectContext
    }
}



#endif
