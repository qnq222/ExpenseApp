//
//  ContentView.swift
//  ExpenseApp
//
//  Created by Ayman AbuMutair on 22/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
