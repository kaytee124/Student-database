import streamlit as st
import pandas as pd


import mysql.connector

# Establish connection
conn = mysql.connector.connect(
    host="0.tcp.eu.ngrok.io",
    port="18873",
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
table_selected = st.selectbox('Select Table', ('Students', 'Courses', 'Course_Taken', 'Degree_Requirements','Majors','Department','grad_Students','Undergrad_Students', 'Degree_Requirements_View', 'Students_View','Majors_View','grad_Students_View','undergrad_Students_View'))


if table_selected:
    if table_selected.endswith('_View'):
        cursor.execute(f"SELECT * FROM {table_selected};")
        data = cursor.fetchall()

        if data:
            columns = [column[0] for column in cursor.description]
            df = pd.DataFrame(data, columns=columns)
            st.write(df)
        else:
            st.write("No data found for the selected view.")
    else:
        cursor.execute(f"SHOW KEYS FROM {table_selected} WHERE Key_name = 'PRIMARY';")
        primary_key_info = cursor.fetchall()
        if primary_key_info:
            primary_key_column = primary_key_info[0][4]  # Extract the column name of the primary key
            cursor.execute(f"SELECT {primary_key_column} FROM {table_selected};")
            primary_keys = [row[0] for row in cursor.fetchall()]

            # Dropdown to select primary key
            primary_key_selected = st.selectbox('Select Primary Key', primary_keys)

            if primary_key_selected:
                # Display data based on table, primary key column, and selected primary key
                display_table_data(table_selected, primary_key_column, primary_key_selected)
        else:
            st.write("No primary key found for the selected table.")





# Close cursor and connection
cursor.close()
conn.close()