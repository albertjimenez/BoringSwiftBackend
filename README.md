# boredapi-backend

A simple swift backend using Kitura as the HTTP REST framework and CouchDB to simply the process of using a NoSQL database for deploying faster.

## Endpoints:

- activity: GET all the boring activities stored in the CouchDB
- activity: DELETE Removes a particular activity passing the ID
- activity: POST Adds a new boring activity conforming the next JSON model to the DB

## JSON MODEL: 

`{
  "name": "Donate blood at a local blood center",
  "accessibility": 0.35,
  "type": "charity",
  "participants": 1,
  "price": 0,
  "link": "https://www.redcross.org/give-blood"
}`

## Used tools:

- MacBookPro 2019
- Apple Swift version 5.0.1 (swiftlang-1001.0.82.4 clang-1001.0.46.5)
- Kitura CouchDB 3.2.0
- HelliumLogger 1.9.0
- Kitura 2.8.1

## Binary

Compiled and exported under Executable folder and Releases page.