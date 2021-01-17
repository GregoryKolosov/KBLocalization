//
//  Int+Extension.swift
//  KBLocalization
//
//  Created by Gregory Kolosov on 17.01.2021.
//

extension Int {
	var lastDigit: Int? {
		"\(self)".compactMap { $0 }.last?.wholeNumberValue
	}
}
