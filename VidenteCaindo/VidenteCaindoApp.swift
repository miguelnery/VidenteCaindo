//
//  VidenteCaindoApp.swift
//  VidenteCaindo
//
//  Created by mik on 21/11/23.
//

import SwiftUI

@main
struct VidenteCaindoApp: App {
    var body: some Scene {
        WindowGroup {
            CardListViewFactory.make()
        }
    }
}
