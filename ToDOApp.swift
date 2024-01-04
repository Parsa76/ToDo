//
//  ToDOApp.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 27.12.23.
//

import SwiftUI

@main
struct ToDOApp: App {
    let dependencies: Dependencies = Dependencies()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabView {
                    HomeView(dependencies: dependencies)
                        .tabItem {
                            Label("Home",systemImage: "house.circle")
                        }
                    TodayKanbanView(dependencies: dependencies)
                        .tabItem {
                            Label("Canban",systemImage: "calendar.circle.fill")
                        }
                }
            }
            .frame(height: UIScreen.main.bounds.height)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
