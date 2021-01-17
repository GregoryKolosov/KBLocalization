//
//  ContentView.swift
//  KBLocalization
//
//  Created by Gregory Kolosov on 09.01.2021.
//

import SwiftUI
	
struct ContentView: View {
   var body: some View {
	  NavigationView {
		HStack {
			Image(LocalizationManager.FirstScreen.image.localized)
			NavigationLink(destination: SecondContentView()) {
				Text(LocalizationManager.FirstScreen.next.localized)
			}.buttonStyle(PlainButtonStyle())
		}
	  }
   }
}

struct SecondContentView: View {
	var body: some View {
		List(0..<10) { item in
			Text("\(item) " + LocalizationManager.SecondScreen.product(count: item).localized)
			
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			ContentView()
				.environment(\.locale, .init(identifier: "ru"))
			SecondContentView()
				.environment(\.locale, .init(identifier: "ru"))
		}
    }
}
