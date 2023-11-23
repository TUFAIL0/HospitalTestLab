import SwiftUI

struct AdminView: View {
    @StateObject private var adminViewModel = AdminViewModel()
    @State private var isAddTestSheetPresented = false
    @State private var selectedTest: Test?
    @State private var newTestType: TestType = .pathology

    var body: some View {
        NavigationView {
            List {
                ForEach(adminViewModel.tests) { test in
                    NavigationLink(destination: TestDetailEditView(test: $selectedTest)) {
                        TestRow(test: test)
                    }
                }
                .onDelete(perform: deleteTest)
            }
            .navigationBarTitle("Admin Tests")
            .navigationBarItems(
                trailing: Button(action: {
                    isAddTestSheetPresented.toggle()
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $isAddTestSheetPresented) {
                AddTestView(adminViewModel: adminViewModel, isSheetPresented: $isAddTestSheetPresented)
            }
        }
    }

    private func deleteTest(at offsets: IndexSet) {
        adminViewModel.deleteTests(at: offsets)
    }
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}

struct AddTestView: View {
    @ObservedObject var adminViewModel: AdminViewModel
    @Binding var isSheetPresented: Bool
    @State private var newTestName = ""
    @State private var newTestType = TestType.pathology

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Test Name", text: $newTestName)
                    Picker("Test Type", selection: $newTestType) {
                        ForEach(TestType.allCases, id: \.self) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                }

                Section {
                    Button("Add Test") {
                        adminViewModel.addTest(name: newTestName, type: newTestType)
                        isSheetPresented = false
                    }
                }
            }
            .navigationBarTitle("Add Test")
            .navigationBarItems(leading: Button("Cancel") {
                isSheetPresented = false
            })
        }
    }
}

struct TestDetailEditView: View {
    @Binding var test: Test?

    var body: some View {
        // Implement test detail editing here
        Text("Test Detail/Edit View")
    }
}

class AdminViewModel: ObservableObject {
    @Published var tests: [Test] = []

    // Functions for adding, modifying, and deleting tests
    func addTest(name: String, type: TestType) {
        let newTest = Test(name: name, type: type, department: "Pathology", sampleType: SampleType.blood)
        tests.append(newTest)
    }

    func deleteTests(at offsets: IndexSet) {
        tests.remove(atOffsets: offsets)
    }
}



struct Test: Identifiable {
    var id = UUID()
    var name: String
    var type: TestType
    var department: String
    var sampleType: SampleType
}

enum TestType: String, CaseIterable {
    case pathology
    case radiology
}

enum SampleType: String, CaseIterable {
    case blood
    case urine
    case lipid
    // Add more sample types as needed
}

