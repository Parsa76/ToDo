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
            TabView {
                NavigationView {
                    HomeView(dependencies: dependencies)
                    
                }
                .tabItem {
                    Label("Home",systemImage: "house.circle")
                }
                
                .navigationViewStyle(StackNavigationViewStyle())
                NavigationView {
                    TodayKanbanView(dependencies: dependencies)
                        .navigationTitle("Today")
                }
                .tabItem {
                    Label("Kanban",systemImage: "calendar.circle.fill")
                }
                
                .navigationViewStyle(StackNavigationViewStyle())
            }
        }
    }
}
