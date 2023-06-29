import UIKit
import SnapKit
import Then

class MOUViewController: BaseViewController<MOUViewModel> {
    let vm = MOUViewModel()

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

