import UIKit
import SnapKit
import Then

class HomeViewController: BaseViewController<HomeViewModel> {
    let vm = HomeViewModel()

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