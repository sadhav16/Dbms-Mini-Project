from Collections import aduser

class adminUser:
    choice = int(input("Enter 1 for admin and 0 for user: "))
    userName = input("Enter you user name :")
    passWord = input("Enter your password :")


    if choice == 1:
        collection = db["adminUser"] 
    else:
        collection = db["User"]
    

    document = collection.find_one({"$and":[{"name":userName},{"password":passWord}]})
    print(document)

    if document:
        print("Authorised user!!")
    else:
        print("Invalid user")