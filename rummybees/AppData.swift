//
import Foundation

func saveData(users: [User]) {
    
    do {
        // Create JSON Encoder
        let encoder = JSONEncoder()

        // Encode Note
        let data = try encoder.encode(users)

        // Write/Set Data
        UserDefaults.standard.set(data, forKey: "users")

    } catch {
        print("Unable to Encode Array of Users (\(error))")
    }
}

func fetchData() -> [User]{
    var users: [User] = []
    
    do {
        
        guard let usersData = UserDefaults.standard.data(forKey: "users") else {
            return users
        }
        // Create JSON Encoder
        let decoder = JSONDecoder()
        

        // Encode Note
        users = try decoder.decode([User].self, from: usersData)

        
        

    } catch {
        print("Unable to Encode Array of Users (\(error))")
    }
    
    return users
    
}
