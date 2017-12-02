# DBMS-mini-project
A mobile specifications website which suggests users about the  best smartphones available in their price range.
Includes a stored procedure,a function and two triggers.
# stored procedure-
inserts user details into the database when a new user signs up.

# function
validates user login.

# trigger
wishlist-insert: increases the popularity of the model by 2 whenever a user adds a device to his/her wishlist.
wishlist-delete: decreases the popularity of the model by 1 whenever a user removes a device to his/her wishlist.

# PHP source code:
first.php ->prompts the user to login,or create a free account.
signup.php ->the user can create an account and will be directed to the home page.
login.php->the page where the user is directed after login or signup.the user is asked to select a price range.
ten.php->all the smartphones in the selected price range are listed here.
specifications.php->shows the specs of the selected smartphone.
wishlist.php->shows the user wishlist.
