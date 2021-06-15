var usersShared = Users(list:[])

struct Users: Codable {
    public let list: [User]

    public init(list: [User]) {
        self.list = list
    }
    
    public func saveList(list: [User]) {
        usersShared = Users(list: list)
    }


}

struct User: Codable {
    var userName: String
    var password: String
    
    public init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
}

