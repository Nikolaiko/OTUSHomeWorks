import SwiftUI

enum NavTransiton {
    case none
    case custom(AnyTransition)
}

enum NavType {
    case push
    case pop
}

enum PopDestination {
    case previous
    case root
}
