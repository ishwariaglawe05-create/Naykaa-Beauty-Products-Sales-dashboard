Online Shopping Product Management System
Project Overview
The Online Shopping Product Management System is a beginner-level Python project that manages product details and basic shopping operations using classes and objects (Object-Oriented Programming).

Users can add products, view the available product list, search for a product, and purchase products. When a purchase is successful, the system calculates the total amount and updates the available stock quantity.
Features
- Add Product: Enter a product name, price, and quantity. The system assigns a product ID.
- Display Products: View all products currently stored in the system.
- Search Product: Search for a product by name (case-insensitive).
- Buy Product: Purchase a product using its product ID and quantity.
- Stock Management: Reduce the available quantity after a successful purchase.
- Bill Generation: Calculate and display the total purchase amount.
- Exit: Close the application.
Concepts Used
- Python
- Classes and Objects
- __init__() constructor
- Instance attributes and methods
- Lists
- for loops
- if-elif-else conditions
- User input with input()
- Type conversion using int() and float()
- Basic calculations and string methods (lower())
Project Structure
The program contains two classes:
1. Product
Stores the details of each product:
- Product ID
- Product name
- Price
- Quantity
The display_product() method displays the product information.
2. Shopping
Manages the product list and shopping operations through these methods:
- add_product()
- display_products()
- search_product()
- buy_product()
A Shopping object is created to run the main menu.
How to Run
1. Download or clone this repository.
2. Open Online Shopping Product Management System.ipynb in Jupyter Notebook.
3. Run the code cell.
4. Use the menu options displayed in the output:
   - 1 — Add Product
   - 2 — Display Products
   - 3 — Search Product
   - 4 — Buy Product
   - 5 — Exit
Example Workflow
1. Add a product with its name, price, and quantity.
2. Display the product list to check the saved details.
3. Search for a product by name.
4. Buy a product by entering its product ID and required quantity.
5. Check the updated stock and purchase bill.
Limitations
- Product data is stored in memory and is lost when the program stops.
- The project does not use a database or online payment gateway.
- The program is a basic learning project and does not include a graphical user interface.
Tools
- Python
- Jupyter Notebook
Author
Ishwari Aglawe
