//
//  File.swift
//  
//
//  Created by 박병관 on 1/1/24.
//

import Foundation
#if canImport(UIKit)
import CoreTransferable
import UniformTypeIdentifiers
import UIKit

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
struct UIImageTranferable: Transferable {
    let image:UIImage

    static var nativeRepresentation: DataRepresentation<Self> {
        DataRepresentation(contentType: .uiImage) { @MainActor transferable in
            
            let image = transferable.image
            return try await withUnsafeThrowingContinuation { continuation in
                let _ = image.loadData(withTypeIdentifier: UTType.uiImage.identifier) { data, error in
                    if let error {
                        continuation.resume(throwing: error)
                    } else if let data {
                        continuation.resume(returning: data)
                    } else {
                       
                        continuation.resume(throwing:  CocoaError(.fileReadCorruptFile))
                    }
                }
            }
            
        } importing: { data in
            let image = try UIImage.object(withItemProviderData: data, typeIdentifier: UTType.uiImage.identifier)
            return .init(image: image)
        }
    }
    static var heicRepresentation: DataRepresentation<Self> {
        DataRepresentation(contentType: .heic) { item in
            try await withUnsafeThrowingContinuation { continuation in
                
                item.image.loadData(withTypeIdentifier: UTType.heic.identifier) { data, error in
                    if let error {
                        continuation.resume(throwing: error)
                    } else if let data {
                        continuation.resume(returning: data)
                    } else {
                       
                        continuation.resume(throwing:  CocoaError(.fileReadCorruptFile))
                    }
                }
            }
            
        } importing: { data in
            let image = try UIImage.object(withItemProviderData: data, typeIdentifier: UTType.heic.identifier)
            return .init(image: image)
        }
    }
    static var pngRepresentation:DataRepresentation<Self> {
        DataRepresentation(contentType: .png) { item in
            let image = item.image
            return try await withUnsafeThrowingContinuation { continuation in

                let _ = image.loadData(withTypeIdentifier: UTType.png.identifier) { data, error in
                    if let error {
                        continuation.resume(throwing: error)
                    } else if let data {
                        continuation.resume(returning: data)
                    } else {
                       
                        continuation.resume(throwing:  CocoaError(.fileReadCorruptFile))
                    }
                }
            }
            
        } importing: { data in
            let image = try UIImage.object(withItemProviderData: data, typeIdentifier: UTType.png.identifier)
            return .init(image: image)
        }
        
    }
    static var jpegRepresentation:DataRepresentation<Self> {
        DataRepresentation(contentType: .jpeg) { item in
            try await withUnsafeThrowingContinuation { continuation in
                
                item.image.loadData(withTypeIdentifier: UTType.jpeg.identifier) { data, error in
                    if let error {
                        continuation.resume(throwing: error)
                    } else if let data {
                        continuation.resume(returning: data)
                    } else {
                       
                        continuation.resume(throwing:  CocoaError(.fileReadCorruptFile))
                    }
                }
            }
            
        } importing: { data in
            let image = try UIImage.object(withItemProviderData: data, typeIdentifier: UTType.jpeg.identifier)
            return .init(image: image)
        }
    }
    static var transferRepresentation: some TransferRepresentation {
        nativeRepresentation
        heicRepresentation
        pngRepresentation
        jpegRepresentation
    }
    
}

@available(iOS 16.0, watchOS 9.0, *)
struct UIColorTransferable:Transferable {
    var color:UIColor
    static var transferRepresentation: DataRepresentation<Self> {
        DataRepresentation(contentType: .uiColor) {
            let color = $0.color
            return try await withUnsafeThrowingContinuation { continuation in
                let _ = color.loadData(withTypeIdentifier: UTType.uiColor.identifier) { [color] data, error in
                    if let error {
                        continuation.resume(throwing: error)
                    } else if let data{
                        continuation.resume(returning: data)
                    } else {
                        continuation.resume(throwing: CocoaError(.coderReadCorrupt))
                    }
                }
            }
        } importing: {
            let color = try UIColor.object(withItemProviderData: $0, typeIdentifier: UTType.uiColor.identifier)
            return .init(color: color)
        }

    }
}

@available(iOS 16.0, watchOS 9.0, *)
struct UIAttributeStringTransferable:Transferable {
    
    var string:NSAttributedString
    
    static var nativeRepresentation: DataRepresentation<Self> {
        DataRepresentation(contentType: .nsattributeString) { item in
            try await withUnsafeThrowingContinuation { continuation in
                item.string.loadData(withTypeIdentifier: UTType.nsattributeString.identifier) { data, error in
                    if let error {
                        continuation.resume(throwing: error)
                    } else if let data {
                        continuation.resume(returning: data)
                    } else {
                       
                        continuation.resume(throwing:  CocoaError(.fileReadCorruptFile))
                    }
                }
            }
        } importing: {
            let string = try NSAttributedString.object(withItemProviderData: $0, typeIdentifier: UTType.nsattributeString.identifier)
            return .init(string: string)
        }
    }
    
    static var transferRepresentation: some TransferRepresentation {
        nativeRepresentation
        DataRepresentation(contentType: .rtfd) { item in
            try await withUnsafeThrowingContinuation { continuation in
                item.string.loadData(withTypeIdentifier: UTType.rtfd.identifier) { data, error in
                    if let error {
                        continuation.resume(throwing: error)
                    } else if let data {
                        continuation.resume(returning: data)
                    } else {
                       
                        continuation.resume(throwing:  CocoaError(.fileReadCorruptFile))
                    }
                }
            }
        } importing: {
            let string = try NSAttributedString.object(withItemProviderData: $0, typeIdentifier: UTType.rtfd.identifier)
            return .init(string: string)
        }
        DataRepresentation(contentType: .flatRTFD) { item in
            try await withUnsafeThrowingContinuation { continuation in
                item.string.loadData(withTypeIdentifier: UTType.flatRTFD.identifier) { data, error in
                    if let error {
                        continuation.resume(throwing: error)
                    } else if let data {
                        continuation.resume(returning: data)
                    } else {
                       
                        continuation.resume(throwing:  CocoaError(.fileReadCorruptFile))
                    }
                }
            }
        } importing: {
            let string = try NSAttributedString.object(withItemProviderData: $0, typeIdentifier: UTType.flatRTFD.identifier)
            return .init(string: string)
        }
        
        ProxyRepresentation {
            $0.string.string
        } importing: {
            .init(string: .init(string: $0))
        }

    }
}
extension UIImage {
    
    func transferableData() async throws -> Data {
        return try await withUnsafeThrowingContinuation { continuation in
            let _ = loadData(withTypeIdentifier: "com.apple.uikit.image") { data, error in
                if let error {
                    continuation.resume(throwing: error)
                } else if let data {
                    continuation.resume(returning: data)
                } else {
                    continuation.resume(throwing: CocoaError(CocoaError.Code.fileReadCorruptFile))
                }
            }
            
        }
    }
}
extension UIColor {
    func transferableData() async throws -> Data {
        return try await withUnsafeThrowingContinuation { continuation in
            let _ = loadData(withTypeIdentifier: "com.apple.uikit.color") { data, error in
                if let error {
                    continuation.resume(throwing: error)
                } else if let data {
                    continuation.resume(returning: data)
                } else {
                    continuation.resume(throwing: CocoaError(CocoaError.Code.fileReadCorruptFile))
                }
            }
        }
    }
}
#endif

