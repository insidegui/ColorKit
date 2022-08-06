//
//  UIImageExtensions.swift
//  ColorKit
//
//  Created by Boris Emorine on 5/30/20.
//  Copyright © 2020 BorisEmorine. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import Cocoa
#endif

extension UIImage {
    
    var resolution: CGSize {
        #if os(macOS)
        return size
        #else
        return CGSize(width: size.width * scale, height: size.height * scale)
        #endif
    }
    
    func resize(to targetSize: CGSize) -> UIImage {
        guard targetSize != resolution else {
            return self
        }

        #if os(macOS)
        let output = self.copy() as! NSImage
        output.size = targetSize
        return output
        #else
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        format.opaque = true
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        let resizedImage = renderer.image { _ in
            self.draw(in: CGRect(origin: CGPoint.zero, size: targetSize))
        }
        
        return resizedImage
        #endif
    }
    
}
