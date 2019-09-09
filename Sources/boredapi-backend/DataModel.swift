//
//  DataModel.swift
//  boredapi-backend
//
//  Created by Albert Sendrós Jiménez on 09/09/2019.
//
import CouchDB

struct MyBoringActivity: Document{
    let _id: String?
    let _rev: String?
    let name: String?
    let accessability: Float?
    let type: String?
    let numParticipants: Int?
    let price: Float?
    let link: String?
}
