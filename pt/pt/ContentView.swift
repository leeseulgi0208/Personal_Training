//
//  ContentView.swift
//  pt
//
//  Created by 송재곤 on 3/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: String = "0"
    
    var body: some View {
        VStack {
            TextField("사용자 이름", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            SecureField("비밀번호", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                // 여기에 로그인 로직을 구현합니다.
                if username == "user" && password == "password" {
                    isLoggedIn = "1"
                } else {
                    isLoggedIn = "-1"
                }
            }) {
                Text("로그인")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            if isLoggedIn == "1" {
                Text("로그인 성공!")
            }else if isLoggedIn == "-1"{
                Text("로그인 실패")
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}

aojdsfkjd
