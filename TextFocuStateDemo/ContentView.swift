//
//  ContentView.swift
//  TextFocuStateDemo
//
//  Created by Thongchai Subsaidee on 23/10/21.
//

//https://youtu.be/lYzqT34mOj8

import SwiftUI

struct ContentView: View {
    
    enum Field: Hashable {
        case firstname
        case lassname
        case emailaddress
        case mobilenumber
        case password
    }
    
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var emailaddress: String = ""
    @State private var mobilenumber: String = ""
    @State private var password: String = ""
    
    @FocusState private var focusField: Field?
    
    var body: some View {
        
        NavigationView {
            Form{
                
                TextField("Firt Name", text: $firstname)
                    .focused($focusField, equals: .firstname)
                    .disableAutocorrection(true)
                    .textContentType(.givenName)
                    .keyboardType(.default)
                
                TextField("Last Name", text: $lastname)
                    .focused($focusField, equals: .lassname)
                    .disableAutocorrection(true)
                    .textContentType(.familyName)
                    .keyboardType(.default)
                
                TextField("Email Address", text: $emailaddress)
                    .focused($focusField, equals: .emailaddress)
                    .disableAutocorrection(true)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                
                TextField("Mobile Number", text: $mobilenumber)
                    .focused($focusField, equals: .mobilenumber)
                    .textContentType(.telephoneNumber)
                    .keyboardType(.default)
                
                SecureField("Password", text: $password)
                    .focused($focusField, equals: .password)
                    .textContentType(.password)
                    .keyboardType(.default)
                
                Button {
                    if firstname.isEmpty {
                        focusField = .firstname
                    }else if lastname.isEmpty {
                        focusField = .lassname
                    }else if emailaddress.isEmpty {
                        focusField = .emailaddress
                    }else if mobilenumber.isEmpty {
                        focusField = .mobilenumber
                    }else if password.isEmpty {
                        focusField = .password
                    }
                     
                } label: {
                    Text("Create Account")
                }

            }
            .navigationBarTitle("@FocusState")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
