import SwiftUI
import CustomRouting

typealias RouterView = CustomRouting.RouterView
typealias Router = CustomRouting.Router
typealias AlertType = CustomRouting.AlertType

@MainActor
struct CoreRouter: GlobalRouter {
    let router: Router
    let builder: CoreBuilder
}
