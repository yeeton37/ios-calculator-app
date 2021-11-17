import UIKit
protocol ButtonActionDelegate {
    func runActionInPhase0(viewController: ViewController, button: UIButton)
    func runActionInPhase1(viewController: ViewController, button: UIButton)
    func runActionInPhase2(viewController: ViewController, button: UIButton)
    func runActionInPhase3(viewController: ViewController, button: UIButton)
    func runActionInPhase4(viewController: ViewController, button: UIButton)
}
