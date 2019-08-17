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
    var isSelected: Bool
    
    init(groupName: String, listGroup: [SelectedListGroup], isSelected: Bool){
        self.groupName = groupName
        self.listGroup = listGroup
        self.isSelected = isSelected
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
