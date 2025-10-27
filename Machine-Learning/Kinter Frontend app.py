import tkinter as tk

# create the main application window

root = tk.Tk()
root.title("Simple Tkinter App")
root.geometry("200x100") # set window size

#Function to print heelo world in console
def say_hello():
    print("Hello, World!")
    print("good bye")

# create button that triggers the say_hello function

hello_button = tk.Button(root, text = "Click me", command = say_hello)

hello_button.pack(pady = 20) #pack the button into the window

#start tkintervent loop

root.mainloop()

