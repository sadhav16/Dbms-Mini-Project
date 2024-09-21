from pymongo import MongoClient
import connection

url = connection.MONGODB_URI
client = MongoClient(url)
db = client["CampusConnect"]
collection = db["adminUser"]

def main():    
    userName = input("Enter you user name :")
    passWord = input("Enter your password :")

    document = collection.find_one({"$and":[{"name":{"$eq":userName}},{"password":passWord}]})
    
    if document:
        print("Authorised user!!")
    else:
        print("Invalid user")