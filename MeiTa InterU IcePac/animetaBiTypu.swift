
import UIKit

public enum AnimationType: Animation {

    case vector(CGVector)
    case zoom(scale: CGFloat)
    case rotate(angle: CGFloat)
    case identity

    public var initialTransform: CGAffineTransform {
        switch self {
        case .vector(let vector):
            return CGAffineTransform(translationX: vector.dx, y: vector.dy)
        case .zoom(let scale):
             return CGAffineTransform(scaleX: scale, y: scale)
        case .rotate(let angle):
            return CGAffineTransform(rotationAngle: angle)
        case .identity:
            return .identity
        }
    }

    public static func random() -> Animation {
        let index = Int.random(in: 0..<3)
        if index == 1 {
            return AnimationType.vector(CGVector(dx: .random(in: -10...10), dy: .random(in: -30...30)))
        } else if index == 2 {
            let scale = Double.random(in: 0...ViewAnimatorConfig.maxZoomScale)
            return AnimationType.zoom(scale: CGFloat(scale))
        }
        let angle = CGFloat.random(in: -ViewAnimatorConfig.maxRotationAngle...ViewAnimatorConfig.maxRotationAngle)
        return AnimationType.rotate(angle: angle)
    }
}
