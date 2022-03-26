//
//  Flavor.swift
//  Runner
//
//  Created by 村松龍之介 on 2020/07/11.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation

enum Flavor: String, CaseIterable {
    case development, staging, production

    static let current: Flavor = {
        let value = Bundle.main.infoDictionary?["FlutterFlavor"]
        let flavor = Flavor(rawValue: (value as? String)?.lowercased() ?? "")
        assert(flavor != nil, "invalid flavor value: \(value ?? "")")
        return flavor ?? .development
    }()

    var apiUrl: String {
        switch self {
        case .development: return "https://development.example.com"
        case .staging: return "https://staging.example.com"
        case .production: return "https://example.com"
        }
    }
}
