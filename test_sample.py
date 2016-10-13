# content of test_sample.py

from flask import Flask, render_template, json, request,redirect,session,jsonify
from flask.ext.mysql import MySQL
from werkzeug import generate_password_hash, check_password_hash

mysql = MySQL()
app = Flask(__name__)
app.secret_key = 'why would I tell you my secret key?'

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'fff!!FFDddddsaa/67'
app.config['MYSQL_DATABASE_DB'] = 'qvantel'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

def func(x):
    return x + 1

def test_answer():
    assert func(0) == 1
	
def test_answer2():
    assert func(1) == 2
	
def test_answer3():
    assert func(2) == 3
	
def test_answer4():
    assert func(3) == 4
	
def test_answer5():
    assert func(4) == 5