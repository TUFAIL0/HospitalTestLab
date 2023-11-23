//
//  TestModel.swift
//  HospitalTestLab
//
//  Created by Tufail Ahmad on 23/11/23.
//

import Foundation
struct User {
    var username: String
    var password: String
    var role: UserRole
}

enum UserRole {
    case admin
    case user
}

struct Test {
    var id: UUID
    var name: String
    var type: TestType
    var departments: [Department]
    var sampleTypes: [SampleType]
    var cost: Double
}

enum TestType {
    case pathology
    case radiology
}

struct Department {
    var id: UUID
    var name: String
}

struct SampleType {
    var id: UUID
    var name: String
}

struct Report {
    var text: String
    var pdfURL: URL
}

