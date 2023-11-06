//
//  KeyboardButton.swift
//  MyFirstTVApp
//
//  Created by Neosoft on 16/08/23.
//

import Foundation
import UIKit

class KeyboardButton: UIButton {
    
    override func awakeFromNib() {
        backgroundColor = .clear
        setTitleColor(.white, for: .normal)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView == self {
           setTitleColor(.orange, for: .normal)

        } else {
            setTitleColor(.white, for: .normal)
        }
    }
}
