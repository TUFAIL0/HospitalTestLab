import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var role: UserRole?
    @StateObject private var testViewModel = TestViewModel()

    @State private var showAlert = false

    var body: some View {
        NavigationView {
            VStack {
                // Login UI
                TextField("Username", text: $username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                SecureField("Password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Login") {
                    login()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                .background(
                    NavigationLink(
                        destination: role == .admin ?
                            AnyView(AdminView()) :
                            AnyView(UserTestsView(testViewModel: testViewModel)),
                        isActive: Binding.constant(role != nil),
                        label: {
                            Text("Login")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(8)
                        })
                        .isDetailLink(false)
 // Disable automatic push behavior

                )

                Spacer() // Add a spacer to push the login button to the top
            }
            .padding()
            .navigationTitle("Login")
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Invalid Login"),
                    message: Text("Please check your username and password."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }

    func login() {
        // Simulate authentication logic
        if username == "admin" && password == "admin123" {
            role = .admin
        } else if username == "user" && password == "user123" {
            role = .user
        } else {
            showAlert = true
            return // Exit the function if login is unsuccessful
        }

        // Navigate to the appropriate view based on the role
        if role == .admin {
            // Navigate to the AdminView
            // Note: You should have a navigation link or similar logic here
            print("Admin logged in")
        } else {
            // Navigate to the UserTestsView
            // Note: You should have a navigation link or similar logic here
            print("User logged in")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

