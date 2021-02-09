import SwiftUI

enum NavigationTransition {
    case none
    case custom(_ pushTransition: AnyTransition, _ popTransition: AnyTransition)
}

enum NavigationType {
    case push
    case pop
}

enum PopDestination {
    case previous
    case root
}
