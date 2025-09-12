from sqlalchemy import create_engine, text

# Create SQLAlchemy engine
engine = create_engine("mysql+mysqlconnector://root:root@localhost/enrollment")

# Define query
query = text("SELECT ID, name, dept_name FROM instructor WHERE dept_name LIKE 'Comp%'")

# Execute and fetch results
with engine.connect() as connection:
    results = connection.execute(query).fetchall()

print("The instructor information from computer science dept:")
for row in results:
    print(row)
