//
//  Application.swift
//  boredapi-backend
//
//  Created by Albert Sendrós Jiménez on 09/09/2019.
//

import CouchDB
import Foundation
import Kitura
import LoggerAPI

public class App {
    
    // 2
    var client: CouchDBClient?
    var database: Database?
    
    let router = Router()
    
    private func postInit() {
        // 1
        let connectionProperties = ConnectionProperties(host: "localhost",
                                                        port: 5984,
                                                        secured: false)
        client = CouchDBClient(connectionProperties: connectionProperties)
        // 2
        client!.retrieveDB("boringactivities") { database, error in
            guard let database = database else {
                // 3
                Log.info("Could not retrieve acronym database: "
                    + "\(String(describing: error?.localizedDescription)) "
                    + "- attempting to create new one.")
                self.createNewDatabase()
                return
            }
            // 4
            Log.info("Acronyms database located - loading...")
            self.finalizeRoutes(with: database)
        }
    }
    
    private func createNewDatabase() {
        client?.createDB("boringactivities") { database, error in
            // 2
            guard let database = database else {
                Log.error("Could not create new database: "
                    + "(\(String(describing: error?.localizedDescription))) "
                    + "- boringactivities routes not created")
                return
            }
            self.finalizeRoutes(with: database)
        }
    }
    
    private func finalizeRoutes(with database: Database) {
        self.database = database
        initializeActivityRoutes(app: self)
        Log.info("Activity routes created")
    }
    
    public func run() {
        // 6
        postInit()
        Kitura.addHTTPServer(onPort: 8080, with: router)
        Kitura.run()
    }
}
