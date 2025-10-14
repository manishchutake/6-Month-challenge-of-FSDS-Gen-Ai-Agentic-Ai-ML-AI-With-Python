import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector

# Function to create a database connection
def get_db_connection():
    return mysql.connector.connect(
        host='localhost',
        user='root',
        password='9823868582',
        database='webgui'
    )

# Function to add student to the database
def add_student():
    studentname = e2.get()
    coursename = e3.get()
    fee = e4.get()
    branch = e5.get()
    gender = e6.get()
    age = e7.get()

    if not studentname or not coursename or not fee or not branch or not gender or not age:
        messagebox.showerror("Input Error", "All fields must be filled.")
        return
   
    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        sql = "INSERT INTO registration (name, course, fee, branch, gender, age) VALUES (%s, %s, %s, %s, %s, %s)"
        values = (studentname, coursename, fee, branch, gender, age)
       
        cursor.execute(sql, values)
        conn.commit()
       
        messagebox.showinfo("Success", "Student record added successfully!")

        e2.delete(0, tk.END)
        e3.delete(0, tk.END)
        e4.delete(0, tk.END)
        e5.delete(0, tk.END)
        e6.delete(0, tk.END)
        e7.delete(0, tk.END)
       
        load_students()

    except mysql.connector.Error as err:
        messagebox.showerror("Database Error", f"Failed to insert student: {err}")
    finally:
        conn.close()

# Function to update student record
def update_student():
    studentid = e1.get()
    if not studentid:
        messagebox.showerror("Selection Error", "Please select a student to update.")
        return

    studentname = e2.get()
    coursename = e3.get()
    fee = e4.get()
    branch = e5.get()
    gender = e6.get()
    age = e7.get()

    if not studentname or not coursename or not fee or not branch or not gender or not age:
        messagebox.showerror("Input Error", "All fields must be filled.")
        return

    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        sql = "UPDATE registration SET name=%s, course=%s, fee=%s, branch=%s, gender=%s, age=%s WHERE id=%s"
        values = (studentname, coursename, fee, branch, gender, age, studentid)
       
        cursor.execute(sql, values)
        conn.commit()
       
        messagebox.showinfo("Success", "Student record updated successfully!")

        e1.config(state="normal")
        e1.delete(0, tk.END)
        e2.delete(0, tk.END)
        e3.delete(0, tk.END)
        e4.delete(0, tk.END)
        e5.delete(0, tk.END)
        e6.delete(0, tk.END)
        e7.delete(0, tk.END)

        load_students()

    except mysql.connector.Error as err:
        messagebox.showerror("Database Error", f"Failed to update student: {err}")
    finally:
        conn.close()

# Function to delete a student
def delete_student():
    studentid = e1.get()
    if not studentid:
        messagebox.showerror("Selection Error", "Please select a student to delete.")
        return

    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        sql = "DELETE FROM registration WHERE id=%s"
        cursor.execute(sql, (studentid,))
        conn.commit()

        messagebox.showinfo("Success", "Student record deleted successfully!")

        e1.config(state="normal")
        e1.delete(0, tk.END)
        e2.delete(0, tk.END)
        e3.delete(0, tk.END)
        e4.delete(0, tk.END)
        e5.delete(0, tk.END)
        e6.delete(0, tk.END)
        e7.delete(0, tk.END)

        load_students()

    except mysql.connector.Error as err:
        messagebox.showerror("Database Error", f"Failed to delete student: {err}")
    finally:
        conn.close()

# Function to load students into the Treeview
def load_students():
    for row in listBox.get_children():
        listBox.delete(row)

    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("SELECT * FROM registration")
        rows = cursor.fetchall()

        for row in rows:
            listBox.insert("", "end", values=row)

    except mysql.connector.Error as err:
        messagebox.showerror("Database Error", f"Failed to load students: {err}")
    finally:
        conn.close()

# Function to populate the entry fields when a row is selected
def on_treeview_select(event):
    selected_item = listBox.selection()
    if selected_item:
        student = listBox.item(selected_item)
        studentid, studentname, coursename, fee, branch, gender, age = student['values']

        e1.config(state="normal")
        e1.delete(0, tk.END)
        e1.insert(0, studentid)

        e2.delete(0, tk.END)
        e2.insert(0, studentname)

        e3.delete(0, tk.END)
        e3.insert(0, coursename)

        e4.delete(0, tk.END)
        e4.insert(0, fee)

        e5.delete(0, tk.END)
        e5.insert(0, branch)

        e6.delete(0, tk.END)
        e6.insert(0, gender)

        e7.delete(0, tk.END)
        e7.insert(0, age)

# Main window
root = tk.Tk()
root.geometry('700x600')
root.title("Student Registration System")

# Labels and Entry Fields
labels = ["Student ID", "Name", "Course", "Fee", "Branch", "Gender", "Age"]
entries = []

for i, text in enumerate(labels):
    tk.Label(root, text=text).grid(row=i, column=0, padx=10, pady=5, sticky="w")
    entry = tk.Entry(root)
    entry.grid(row=i, column=1, padx=10, pady=5)
    entries.append(entry)

# Assign entries to variables
e1, e2, e3, e4, e5, e6, e7 = entries
e1.config(state="disabled")  # ID should not be editable

# Buttons (row 7)
tk.Button(root, text="Add", width=15, command=add_student).grid(row=7, column=0, padx=10, pady=10)
tk.Button(root, text="Update", width=15, command=update_student).grid(row=7, column=1, padx=10, pady=10)
tk.Button(root, text="Delete", width=15, command=delete_student).grid(row=7, column=2, padx=10, pady=10)

# Treeview (row 8)
cols = ("id", "name", "course", "fee", "branch", "gender", "age")
listBox = ttk.Treeview(root, columns=cols, show="headings")
listBox.grid(row=8, column=0, columnspan=3, padx=10, pady=10, sticky="nsew")

for col in cols:
    listBox.heading(col, text=col)
    listBox.column(col, width=100)

listBox.bind("<ButtonRelease-1>", on_treeview_select)

# Load existing students
load_students()

root.mainloop()
