//
//  TestViewModel.swift
//  HospitalTestLab
//
//  Created by Tufail Ahmad on 23/11/23.
//

import Foundation
class AppViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var tests: [Test] = [] // This should be loaded from your database

    // Add, modify, delete test functions

    // Map a test to department(s) and sample type(s)

    // Download report function

    // Other necessary functions
}
