//
//  UILabel+Rx.swift
//  RxAppState
//
//  Created by Jörn Schoppe on 06.03.16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxAppState

extension Reactive where Base: UILabel {
    public var appState: UIBindingObserver<UILabel, AppState> {
        return UIBindingObserver(UIElement: self.base) { label, appState in
            switch appState {
            case .active:
                label.backgroundColor = UIColor.green
                label.text = "ACTIVE"
            case .inactive:
                label.backgroundColor = UIColor.yellow
                label.text = "INACTIVE"
            case .background:
                label.backgroundColor = UIColor.red
                label.text = "BACKGROUND"
            case .terminated:
                label.backgroundColor = UIColor.lightGray
                label.text = "TERMINATED"
            }
        }
    }

    public var firstLaunch: UIBindingObserver<UILabel, Bool> {
        return UIBindingObserver(UIElement: self.base) { label, isFirstLaunch in
            if isFirstLaunch {
                label.backgroundColor = UIColor.green
                label.text = "YES"
            } else {
                label.backgroundColor = UIColor.red
                label.text = "NO"
            }
        }
    }
}

