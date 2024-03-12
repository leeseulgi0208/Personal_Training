// LoginView.swift

import SwiftUI
import RealmSwift

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        VStack {
            TextField("사용자 이름", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("비밀번호", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                authenticate(username: username, password: password)
            }) {
                Text("로그인")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            NavigationLink(destination: SignupView()) {
                Text("회원가입")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("오류"), message: Text(alertMessage), dismissButton: .default(Text("확인")))
        }
    }
    
    func authenticate(username: String, password: String) {
        do {
            let realm = try Realm()
            let user = realm.objects(User.self).filter("username == %@", username).first
            if let user = user, user.password == password {
                isLoggedIn = true
            } else {
                showAlert = true
                alertMessage = "로그인 실패: 사용자 이름 또는 비밀번호가 일치하지 않습니다."
            }
        } catch {
            showAlert = true
            alertMessage = "오류: \(error.localizedDescription)"
        }
    }
}
