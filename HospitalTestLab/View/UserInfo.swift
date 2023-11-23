//
//  UserInfo.swift
//  HospitalTestLab
//
//  Created by Tufail Ahmad on 23/11/23.

import SwiftUI

struct Department {
    var name: String
}

struct UserTestsView: View {
    @ObservedObject var testViewModel: TestViewModel

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Pathology")) {
                    ForEach(pathologyTests) { test in
                        TestRow(test: test)
                    }
                }

                Section(header: Text("Radiology")) {
                    ForEach(radiologyTests) { test in
                        TestRow(test: test)
                    }
                }
            }
            .navigationTitle("User Tests")
        }
    }

    var pathologyTests: [Test] {
        return testViewModel.tests.filter { $0.department == "Pathology" }
    }


    var radiologyTests: [Test] {
        return testViewModel.tests.filter { $0.department == "Radiology" }
    }
}

struct TestRow: View {
    var test: Test

    var body: some View {
        VStack(alignment: .leading) {
            Text(test.name)
            Text("Type: \(test.type.rawValue)")
            Text("Sample Type: \(test.sampleType.rawValue)")
        }
    }
}

struct UserTestsView_Previews: PreviewProvider {
    static var previews: some View {
        UserTestsView(testViewModel: TestViewModel())
    }
}
