# This script runs automatically when our `app` module is first loaded,
# and handles all the setup for our Flask app.
from flask import Flask
app = Flask(__name__)
app.secret_key = 'Example Secret Key (CHANGE THIS TO YOUR OWN SECRET KEY!)'
from app import connect
from app import db
db.init_db(app, connect.dbuser, connect.dbpass, connect.dbhost, connect.dbname)
from app import request
from app import testGenerate