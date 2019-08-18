import Foundation

public struct Group {
    let groupName: String
    var listGroup : [ListGroup]
}

public struct ListGroup {
    let listGroupName: String
}

struct SelectedGroup {
    let groupName: String
    var listGroup: [SelectedListGroup]
    
    init(groupName: String, listGroup: [SelectedListGroup]){
        self.groupName = groupName
        self.listGroup = listGroup
    }
}

struct SelectedListGroup {
    let listGroupName: String
    var isSelected : Bool
    
    init(listGroupName : String,isSelected: Bool) {
        self.listGroupName = listGroupName
        self.isSelected = isSelected
    }
}
