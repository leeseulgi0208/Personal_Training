//
//  ptApp.swift
//  pt
//
//  Created by 송재곤 on 3/7/24.
//

import SwiftUI
import RealmSwift

class User: Object {
    @Persisted var username: String
    @Persisted var password: String
    // 필요한 경우 추가 속성을 추가합니다.
}


@main
struct ptApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                            LoginView()
                        }
        }
    }
}
