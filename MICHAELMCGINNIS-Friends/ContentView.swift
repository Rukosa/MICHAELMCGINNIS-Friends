//
//  ContentView.swift
//  MICHAELMCGINNIS-Friends
//
//  Created by Michael Mcginnis on 4/4/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var users = UserC()
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var cusers: FetchedResults<CachedUser>
    
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
                //saveData()
            }
        } catch{
            print("Decode failed")
        }
    }
    
    
    func saveData(){
        for userShort in users.users{
            let user = CachedUser(context: moc)
            //let userShort = usee//users.users[usee]
            user.id = userShort.id
            user.name = userShort.name
            user.isActive = userShort.isActive
            user.email = userShort.email
            user.about = userShort.about
            user.address = userShort.address
            user.registered = userShort.registered
            user.company = userShort.company
            user.age = Int16(userShort.age)
            user.tags = userShort.tags.joined(separator: ",")
            
            for friend in userShort.friends{
                let fren = CachedFriend(context: moc)
                fren.id = friend.id
                fren.name = friend.name
                fren.userFriend?.insert(user)
            }
            
            try? moc.save()
            //print("data saved")
        }
        
    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(users.users) {user in
                //ForEach(cusers.indices){ userer in
                      //  cusers[userer]
                    NavigationLink(destination: DetailView(user: user)){
                        VStack{
                            UserView(user: user)
                        }
                    }
                }
            }.navigationTitle("Friends")
        }.task{
            if users.users.isEmpty{
                for coreDataUser in cusers {
                    let user = User(cachedUser: coreDataUser)
                    users.users.append(user)
                }
                await grabData()
            }
            await MainActor.run{
                saveData()
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
