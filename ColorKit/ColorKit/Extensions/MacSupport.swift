import CoreImage

#if os(macOS)

import Cocoa

extension NSImage {
    var cgImage: CGImage? {
        cgImage(forProposedRect: nil, context: nil, hints: nil)
    }
}

extension CIImage {

    convenience init?(image: NSImage) {
        guard let cgImage = image.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }

}

#else

import UIKit

#endif

extension UIColor {
    var ciColor: CIColor {
        #if os(macOS)
        guard let output = CIColor(color: self) else {
            assertionFailure("Couldn't create CIColor from NSColor")
            return CIColor.clear
        }
        return output
        #else
        return CIColor(color: self)
        #endif
    }
}
