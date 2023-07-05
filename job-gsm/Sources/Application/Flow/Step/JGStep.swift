import RxFlow
import UIKit

enum JGStep: Step {
    //MARK: onBoarding
    case onBoardingIsRequired
    
    //MARK: Inesrt Info
    case insertInfoIsRequired
    
    //MARK: Home
    case homeIsRequired
    
    //MARK: MOU
    case mouIsRequired
    
    //MARK: Profile
    case profileIsRequired
    
    //MARK: TabBar
    case tabBarIsRequired
    
    //MARK: Detail
    case detailIsRequired(idx: Int)
}
