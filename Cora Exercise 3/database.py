import boto3

#connect to DynamoDB in our region
dynamodb = boto3.resource("dynamodb", region_name="us-east-2")

#connect to SyncTrip table
table = dynamodb.Table("SyncTripTrips")

def create_trip(trip_id, name, destination, start_date):
    table.put_item(
        Item={
            "trip_id": trip_id,
            "name": name,
            "destination": destination,
            "start_date": start_date,
            "status": "planning"
        }
    )

    print(f"Trip '{name}' was successfully created!")

def get_trip(trip_id):
    response = table.get_item(
        Key={
            "trip_id": trip_id
        }
    )

    if "Item" in response:
        trip = response["Item"]

        print("\nTrip found!")
        print("Trip ID:", trip["trip_id"])
        print("Name:", trip["name"])
        print("Destination:", trip["destination"])
        print("Start Date:", trip["start_date"])
        print("Status:", trip["status"])
    else:
        print("Trip not found.")

def update_trip(trip_id, new_destination):
    table.update_item(
        Key={
            "trip_id": trip_id
        },
        UpdateExpression="SET destination = :destination",
        ExpressionAttributeValues={
            ":destination": new_destination
        }
    )

    print(f"Trip '{trip_id}' was successfully updated!")

def delete_trip(trip_id):
    table.delete_item(
        Key={
            "trip_id": trip_id
        }
    )

    print(f"Trip '{trip_id}' was successfully deleted!")

def list_trips():
    response = table.scan()
    trips = response["Items"]

    if len(trips) == 0:
        print("No trips found.")
        return

    print("\nAll Trips:")

    for trip in trips:
        print("--------------------")
        print("Trip ID:", trip["trip_id"])
        print("Name:", trip["name"])
        print("Destination:", trip["destination"])
        print("Start Date:", trip["start_date"])
        print("Status:", trip["status"])

#create_trip(
#    "trip1",
#    "Scotland trip",
#    "Edinburgh",
#    "10/15/26"
#)

#update_trip("trip1", "Glasgow")
#get_trip("trip1")

#delete_trip("trip1")
#get_trip("trip1")

#create_trip(
#    "trip001",
#    "Scotland Trip",
#    "Edinburgh",
#    "2026-10-15"
#)

#create_trip(
#    "trip002",
#    "Senior Trip",
#    "Chicago",
#    "2027-03-13"
#)

#create_trip(
#    "trip003",
#    "Beach Trip",
#    "Miami",
#    "2027-05-20"
#)

#list_trips()