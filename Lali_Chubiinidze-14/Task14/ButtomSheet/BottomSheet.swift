//
//  BottomSheet.swift
//  task14(lali_chubinidze)
//
//  Created by iveri gamezardashvili on 7/9/22.
//

import UIKit

class BottomSheet: UIView {
    var action: (() -> Void)!

    @IBAction func showLoginPage(_ sender: Any) {
        action()
    }

    @IBAction func dismiss(_ sender: Any) {
        removeFromSuperview()

    }
}
