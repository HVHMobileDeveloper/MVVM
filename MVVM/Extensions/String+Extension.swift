//
//  String+Extension.swift
//  MVVM
//
//  Created by mobileteam on 2/20/20.
//  Copyright © 2020 mobileteam. All rights reserved.
//

import Foundation
extension String {
    func isValidEmail() -> Bool {
        guard !self.lowercased().hasPrefix("mailto:") else { return false }
        guard let emailDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else { return false }
        let matches = emailDetector.matches(in: self, options: NSRegularExpression.MatchingOptions.anchored, range: NSRange(location: 0, length: self.count))
        guard matches.count == 1 else { return false }
        return matches[0].url?.scheme == "mailto"
    }
}
