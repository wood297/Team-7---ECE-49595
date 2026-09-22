from database import create_trip, get_trip, update_trip, delete_trip, list_trips


def display_menu():
    print("\n=== SyncTrip AWS Database Manager ===")
    print("1. Create Trip")
    print("2. Get Trip")
    print("3. Update Trip Destination")
    print("4. Delete Trip")
    print("5. List All Trips")
    print("6. Exit")


while True:
    display_menu()

    choice = input("\nSelect an option: ")

    if choice == "1":
        print("\n--- Create Trip ---")

        trip_id = input("Trip ID: ")
        name = input("Trip name: ")
        destination = input("Destination: ")
        start_date = input("Start date: ")

        create_trip(trip_id, name, destination, start_date)

    elif choice == "2":
        print("\n--- Get Trip ---")

        trip_id = input("Trip ID: ")
        get_trip(trip_id)

    elif choice == "3":
        print("\n--- Update Trip ---")

        trip_id = input("Trip ID: ")
        new_destination = input("New destination: ")

        update_trip(trip_id, new_destination)

    elif choice == "4":
        print("\n--- Delete Trip ---")

        trip_id = input("Trip ID: ")
        delete_trip(trip_id)

    elif choice == "5":
        list_trips()

    elif choice == "6":
        print("Goodbye!")
        break

    else:
        print("Invalid option. Please choose 1-6.")