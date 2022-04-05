//
//  ContentView.swift
//  MICHAELMCGINNIS-Friends
//
//  Created by Michael Mcginnis on 4/4/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var users = UserC()
    
    func grabData() async{
        guard let encoded = try? JSONEncoder().encode(users) else{
            print("Failed to encode users")
            return
        }
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var request = URLRequest(url: url)
        request.setValue("applications/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        do{
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedUsers = try decoder.decode([User].self, from: data)
            //users.users = decodedUsers
            DispatchQueue.main.async {
                users.users = decodedUsers
            }
        } catch{
            print("Decode failed")
        }
    }
    var body: some View {
        NavigationView{
            List{
                ForEach(users.users) {user in
                    NavigationLink(destination: DetailView(user: user)){
                        VStack{
                            UserView(user: user)
                        }
                    }
                }
            }.navigationTitle("Friends")
        }.onAppear{
            Task{
                await grabData()
            }
        }
    }
}

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(users: [User()])
    }
}*/
