//
//  MyRouter.swift
//  boredapi-backend
//
//  Created by Albert Sendrós Jiménez on 09/09/2019.
//

import Foundation
import CouchDB
import Kitura
import KituraContracts
import LoggerAPI

// 1
private var database: Database?

func initializeActivityRoutes(app: App) {
    database = app.database
    app.router.get("/activity", handler: getActivity)
    app.router.post("/activity", handler: addActivity)
    app.router.delete("/activity", handler: deleteActivity)
}

// 4
private func getActivity(completion: @escaping ([MyBoringActivity]?,
    RequestError?) -> Void) {
    
    guard let database = database else {
        return completion(nil, .internalServerError)
    }
    MyBoringActivity.Persistence.getAll(from: database) { activities, error in
        return completion(activities, error as? RequestError)
    }
    
}

// 5
private func addActivity(myBoringActivity: MyBoringActivity, completion: @escaping (MyBoringActivity?,
    RequestError?) -> Void) {
    guard let database = database else {
        return completion(nil, .internalServerError)
    }
    MyBoringActivity.Persistence.save(myBoringActivity, to: database) { newActivity, error in
        return completion(newActivity, error as? RequestError)
    }
}

// 6
private func deleteActivity(id: String, completion: @escaping
    (RequestError?) -> Void) {
    
    guard let database = database else {
        return completion(.internalServerError)
    }
    MyBoringActivity.Persistence.delete(id, from: database) { error in
        return completion(error as? RequestError)
    }
}
