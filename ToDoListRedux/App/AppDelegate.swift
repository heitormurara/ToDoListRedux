import UIKit
import ReSwift

var store = Store<AppState>(reducer: appReducer, state: nil)

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appRouter: AppRouter?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.makeKeyAndVisible()
        appRouter = AppRouter(window: window)
        
        return true
    }
}
