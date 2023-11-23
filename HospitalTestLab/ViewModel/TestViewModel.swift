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
class TestViewModel: ObservableObject {
    @Published var tests: [Test] = []

    init() {
        // Preload some sample data
        tests = [
            Test(name: "Test1", type: .pathology, department: Department(name: "Pathology").name, sampleType: .blood),
            Test(name: "Test2", type: .pathology, department: Department(name: "Pathology").name, sampleType: .urine),
            Test(name: "Test3", type: .radiology, department: Department(name: "Radiology").name, sampleType: .lipid),
            // Add more test data as needed
        ]
    }


    // Add functions for mapping tests to departments and sample types
}

