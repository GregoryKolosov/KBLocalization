//
//  LocalizationManager.swift
//  KBLocalization
//
//  Created by Gregory Kolosov on 09.01.2021.
//

import Foundation

protocol LocalizableDelegate {
	var rawValue: String { get }
	var table: String? { get }
	var localized: String { get }
}

extension LocalizableDelegate {
	var localized: String {
		Bundle.main.localizedString(forKey: rawValue, value: nil, table: table)
	}
	
	var table: String? {
		nil
	}
}

enum LocalizationManager {
	enum FirstScreen: String, CaseIterable, LocalizableDelegate {
		case next = "firstScreenNextKey"
		case image = "firstScreenImageKey"
	}
	
	enum SecondScreen: String, CaseIterable, LocalizableDelegate {
		case productZero = "secondScreenProductZeroKey"
		case productOne = "secondScreenProductOneKey"
		case productTwo = "secondScreenProductTwoKey"
		case productFew = "secondScreenProductFewKey"
		case productMany = "secondScreenProductManyKey"
		
		static func product(count: Int) -> SecondScreen {
			guard let count = count.lastDigit else { return .productZero }
			switch count {
			case 0: return .productZero
			case 1: return .productOne
			case 2: return .productTwo
			case 3...4: return .productFew
			case 5...: return .productMany
			default: return .productZero
			}
		}
	}
}

