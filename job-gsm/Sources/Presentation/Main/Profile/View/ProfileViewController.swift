import UIKit
import SnapKit
import Then

class ProfileViewController: BaseViewController<ProfileViewModel> {
    let vm = ProfileViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        super.init(vm)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

