import mysql.connector
  
# Establish a connection to the database
cnx = mysql.connector.connect(
    user='root', password='root', database='enrollment')
# create a cursor object
cursor = cnx.cursor()
# execute an SQL query
query = "SELECT ID, name, dept_name FROM instructor WHERE dept_name LIKE 'Comp%'"
cursor.execute(query)
# Fetch the results and print them
print("The instructor information from computer science dept:")
for result in cursor:
    print(result)
# Close the cursor and connection
cursor.close()
cnx.close()
