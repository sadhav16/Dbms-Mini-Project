from pymongo import MongoClient

MONGODB_URI = "mongodb+srv://yoshuaraju:yoshua2004@cluster0.vcsxy.mongodb.net/?retryWrites=true&w=majority"
client = MongoClient(MONGODB_URI)

db = client["campusConnect"]