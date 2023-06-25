name = "penghao"

//  [for k,v in var.name_map: upper(k) if k!="user1"]
name_map = {
  user1: "penghao",
  user2: "xinxin"
}

// [for i,v in var.name_list: i]
name_list = ["penghao", "xinxin"]


// var.name_list_slap[*].name
name_list_slap = [
  {title: "user1", name: "penghao"},
  {title: "user2", name: "xinxin"},
]

resource_group_name_prefix = "rg"
resource_group_location    = "westus2"