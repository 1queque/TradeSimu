//
//  SignUpViewModel.swift
//  EarlBlack
//
//  Created by queque on 9.06.2022.
//

import Foundation

class SignUpViewModel{
    var table_view_list:[String:Any]
    
    init(from table_view_list: [String:Any]) {
        self.table_view_list = table_view_list
    }
    
    func set_data_to_encode(){
        let user = User(from: self.table_view_list)
        print(user.username)
    }
    
    
}
