import UIKit
import Then

extension UINavigationItem {
    func leftBarButtonItem() {
        let profileButton = UIBarButtonItem().then {
            $0.image = UIImage(named: "HomeLogo.svg")?.withRenderingMode(.alwaysTemplate)
        }
        self.setRightBarButton(profileButton, animated: true)
    }
}
