//
//  ContentView.swift
//  TabView
//
//  Created by Adriano Rezena on 19/06/24.
//

import SwiftUI

struct ContentView: View {
    // If the selectedTab is initialized with `1`, the onAppear of the thirdView will be executed too.
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            FirstView()
                .tag(0)
                .onAppear {
                    print("FirstView appeared")
                }
            
            SecondView()
                .tag(1)
                .onAppear {
                    print("SecondView appeared")
                }
            
            ThirdView()
                .tag(2)
                .onAppear {
                    print("ThirdView appeared")
                }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onChange(of: selectedTab) { newValue in
            handleTabChange(to: newValue)
        }
    }
    
    private func handleTabChange(to index: Int) {
        switch index {
        case 0:
            print("First tab selected")

        case 1:
            print("Second tab selected")
            
        case 2:
            print("Third tab selected")

        default:
            break
        }
    }
}

struct FirstView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("First View")
                    .font(.largeTitle)
                    .padding()
                    .frame(height: 2000)
            }
            .frame(maxWidth: .infinity)
            .background(Color.red.opacity(0.3))
        }
    }
}

struct SecondView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Second View")
                    .font(.largeTitle)
                    .padding()
                    .frame(height: 2000)
            }
            .frame(maxWidth: .infinity)
            .background(Color.blue.opacity(0.3))
        }
    }
}

struct ThirdView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Third View")
                    .font(.largeTitle)
                    .padding()
                    .frame(height: 2000)
            }
            .frame(maxWidth: .infinity)
            .background(Color.green.opacity(0.3))
        }
    }
}


#Preview {
    ContentView()
}
