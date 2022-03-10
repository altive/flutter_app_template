//
//  BuildMode.swift
//  Runner
//
//  Created by 村松龍之介 on 2020/07/11.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation

enum BuildMode: CaseIterable {
    case debug, release

    #if DEBUG
    static let current = BuildMode.debug
    #else
    static let current = BuildMode.release
    #endif
}
