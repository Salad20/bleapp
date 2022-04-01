
import UIKit

extension CALayer {

        func isAnimating() -> Bool {
            return (self.animationKeys()?.count ?? 0) > 0
        }
}
