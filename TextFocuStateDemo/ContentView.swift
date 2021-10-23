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
    
    @State private var isRegister: Bool = false
    
    var body: some View {
        
        NavigationView {
            Form{
                
                TextField("Firt Name", text: $firstname)
                    .focused($focusField, equals: .firstname)
                    .submitLabel(.next)
                    .disableAutocorrection(true)
                    .textContentType(.givenName)
                    .keyboardType(.default)
                
                TextField("Last Name", text: $lastname)
                    .focused($focusField, equals: .lassname)
                    .submitLabel(.next)
                    .disableAutocorrection(true)
                    .textContentType(.familyName)
                    .keyboardType(.default)
                
                TextField("Email Address", text: $emailaddress)
                    .focused($focusField, equals: .emailaddress)
                    .submitLabel(.next)
                    .disableAutocorrection(true)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                
                TextField("Mobile Number", text: $mobilenumber)
                    .focused($focusField, equals: .mobilenumber)
                    .submitLabel(.next)
                    .textContentType(.telephoneNumber)
                    .keyboardType(.default)
                
                SecureField("Password", text: $password)
                    .focused($focusField, equals: .password)
                    .submitLabel(.join)
                    .textContentType(.password)
                    .keyboardType(.default)
                
                
                HStack(alignment:.center) {
                    
                }
                
                if isRegister {
                    Text("Account Create")
                        .foregroundColor(.red)
                        .padding(.vertical)
                }else {
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
                        }else {
                            isRegister = true
                        }
                    } label: {
                        Text("Create Account")
                    }
                }
                

            }
            .onSubmit {
                switch focusField {
                case .firstname:
                    focusField = .lassname
                case .lassname:
                    focusField = .emailaddress
                case .emailaddress:
                    focusField = .mobilenumber
                case .mobilenumber:
                    focusField = .password
                default:
                    print("Creating account")
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
