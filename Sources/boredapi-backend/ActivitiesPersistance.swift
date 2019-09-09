//
//  ActivitiesPersistance.swift
//  boredapi-backend
//
//  Created by Albert Sendrós Jiménez on 09/09/2019.
//

import Foundation
import CouchDB
import LoggerAPI

extension MyBoringActivity {
    // 1
    class Persistence {
        // 2
        static func getAll(from database: Database, callback:
            @escaping (_ myBoringActivities: [MyBoringActivity]?, _ error: Error?) -> Void) {
            
            database.retrieveAll(includeDocuments: true) { documents, error in
                guard let documents = documents else {
                    Log.error("Error retrieving all documents: \(String(describing: error))")
                    return callback(nil, error)
                }
                //2
                let myBoringActivitiesArray = documents.decodeDocuments(ofType: MyBoringActivity.self)
                callback(myBoringActivitiesArray, nil)
        }
        }
        
        // 3
        static func save(_ myBoringActivity: MyBoringActivity, to database: Database, callback:
            @escaping (_ myBoringActivity: MyBoringActivity?, _ error: Error?) -> Void) {
            database.create(myBoringActivity) { document, error in
                guard let document = document else {
                    Log.error("Error creating new document: \(String(describing: error))")
                    return callback(nil, error)
                }
                // 2
                database.retrieve(document.id, callback: callback)
            }
        }
        
        // 4
        static func delete(_ myBoringActivityID: String, from database: Database, callback:
            @escaping (_ error: Error?) -> Void) {
            
            database.retrieve(myBoringActivityID) { (acronym: MyBoringActivity?, error: CouchDBError?) in
                guard let acronym = acronym, let acronymRev = acronym._rev else {
                    Log.error("Error retrieving document: \(String(describing:error))")
                    return callback(error)
                }
                // 2
                database.delete(myBoringActivityID, rev: acronymRev, callback: callback)
            }
            
        }
    }
    }

