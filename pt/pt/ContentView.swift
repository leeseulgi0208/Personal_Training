//
//  ContentView.swift
//  pt
//
//  Created by 송재곤 on 3/7/24.


import SwiftUI
import RealmSwift

struct SignupView: View {// 회원가입
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            TextField("사용자 이름", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("비밀번호", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                let newUser = User()
                newUser.username = username
                newUser.password = password
                do {
                    let realm = try Realm()
                    try realm.write {
                        realm.add(newUser)
                    }
                    // 가입 성공 처리
                } catch {
                    // 오류 처리
                    print("오류: \(error)")
                }
            }) {
                Text("가입")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
}





