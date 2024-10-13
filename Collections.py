from connection import MONGODB_URI, client, db

user = db["User"]
aduser = db["adminUser"]
event = db["Event"]
map = db["Map"]
registeration = db["Registeration"]