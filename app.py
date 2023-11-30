import streamlit as st
import pandas as pd


import mysql.connector

# Establish connection
conn = mysql.connector.connect(
    host="5.tcp.eu.ngrok.io",
    port="12649",
    user="root",
    password="MARIAcurie@1965",
    database="PBJ_Database"
)

cursor = conn.cursor()

# Function to fetch and display table data based on user selection
def display_table_data(table_name, primary_key, selected_key):
    query = f"SELECT * FROM {table_name} WHERE {primary_key} = '{selected_key}';"
    cursor.execute(query)
    data = cursor.fetchall()
    if data:
        # Fetch column names
        cursor.execute(f"SHOW COLUMNS FROM {table_name};")
        columns = [column[0] for column in cursor.fetchall()]

        # Create a DataFrame with fetched data and assign column names
        df = pd.DataFrame(data, columns=columns)
        st.write(df)  # Display the DataFrame as a table
    else:
        st.write("No data found for the selected key.")  # If no data found

# Title for your Streamlit app
st.title('MySQL Database Interface')




# Dropdown to select tables
table_selected = st.selectbox('Select Table', ('Students', 'Courses', 'Course_Taken', 'Degree_Requirements','Majors','Department','grad_Students','Undergrad_Students'))

if table_selected:
    # Fetch primary keys for the selected table
    cursor.execute(f"SHOW KEYS FROM {table_selected} WHERE Key_name = 'PRIMARY';")
    primary_key_info = cursor.fetchall()
    primary_key_column = primary_key_info[0][4]  # Extract the column name of the primary key

    # Fetch all primary keys from the selected table
    cursor.execute(f"SELECT {primary_key_column} FROM {table_selected};")
    primary_keys = [row[0] for row in cursor.fetchall()]

    # Dropdown to select primary key
    primary_key_selected = st.selectbox('Select Primary Key', primary_keys)

    if primary_key_selected:
        # Display data based on table, primary key column, and selected primary key
        display_table_data(table_selected, primary_key_column, primary_key_selected)

# Close cursor and connection
cursor.close()
conn.close()