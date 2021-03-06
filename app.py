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

@app.route('/')
def main():
    return render_template('index.html')

@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')

@app.route('/showAddProduct')
def showAddProduct():
    return render_template('addProduct.html')

@app.route('/showSignin')
def showSignin():
    if session.get('user'):
        return render_template('userHome.html')
    else:
        return render_template('signin.html')

@app.route('/userHome')
def userHome():
    if session.get('user'):
        return render_template('userHome.html')
    else:
        return render_template('error.html',error = 'Unauthorized Access')

@app.route('/logout')
def logout():
    session.pop('user',None)
    return redirect('/')

@app.route('/deleteProduct',methods=['POST'])
def deleteProduct():
    try:
        if session.get('user'):
            _id = request.form['id']
            _user = session.get('user')

            # connect to mysql
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_deleteProduct',(_id,_user))
            result = cursor.fetchall()

            if len(result) is 0:
                conn.commit()
                return json.dumps({'status':'OK'})
            else:
                return json.dumps({'status':'An Error occured'})
        else:
            return render_template('error.html',error = 'Unauthorized Access')
    except Exception as e:
        return json.dumps({'status':str(e)})
    finally:
        cursor.close()
        conn.close()

@app.route('/getProductById',methods=['POST'])
def getProductById():
    try:
        if session.get('user'):
            
            _id = request.form['id']
            _user = session.get('user')
    
            # connect to mysql
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_GetProductById',(_id,_user))
            result = cursor.fetchall()

            product = []
            product.append({'Id':result[0][0],'Name':result[0][1],'Description':result[0][2],'Price':result[0][5],'Count':result[0][6]})

            return json.dumps(product)
        else:
            return render_template('error.html', error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html',error = str(e))

# for listing porducts
@app.route('/getProduct',methods=['POST'])
def getProduct():
    try:
        if session.get('user'):
            _user = session.get('user')
            _limit = request.form['itemsPerPage']
            _offset = request.form['offset']
            _searchword = request.form['searchData']
            _searchstyle = request.form['nameChecked'] #Search by product_title (true) or product_price (false)
            _total_records = 0
            _searcby = 'product_title'

            # connect to mysql
            con = mysql.connect()
            cursor = con.cursor()

            # Sort by title or price of the product
            if not _searchword:
                _searchword = ''
            if _searchstyle == 'true':
                _searchby = 'product_title'
            else:
                _searchby = 'product_price'
        
            cursor.callproc('sp_Get2ProductByUser',(_user,_limit,_offset,_searchword,_searchby,'true',_total_records))
            products = cursor.fetchall()     
            cursor.close()
             
            cursor = con.cursor()
            cursor.execute('SELECT @_sp_Get2ProductByUser_6');
             
            outParam = cursor.fetchall()

            response = []
            products_dict = []
            for product in products:
                product_dict = {
                        'Id': product[0],
                        'Name': product[1],
                        'Description': product[2],
                        'Price' : product[5],
                        'Count':product[6],
                        'Date': product[4]}
                products_dict.append(product_dict)
            response.append(products_dict)
            response.append({'total':outParam[0][0]}) 

            return json.dumps(response)
        else:
            return render_template('error.html', error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html', error = str(e))

@app.route('/addProduct',methods=['POST'])
def addProduct():
    try:
        if session.get('user'):
            _name = request.form['inputName']
            _description = request.form['inputDescription']
            _price = request.form['inputPrice']
            _count = request.form['inputCount']
            _user = session.get('user')
            
            # connect to mysql
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_addProduct',(_name,_description,_user,_price,_count))
            data = cursor.fetchall()

            if len(data) is 0:
                conn.commit()
                return redirect('/userHome')
            else:
                return render_template('error.html',error = 'An error occurred!')

        else:
            return render_template('error.html',error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        conn.close()

@app.route('/updateProduct', methods=['POST'])
def updateProduct():
    try:
        if session.get('user'):
            _user = session.get('user')
            _name = request.form['name']
            _price = request.form['price']
            _count = request.form['count']
            _description = request.form['description']
            _product_id = request.form['id']

            # connect to mysql
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_updateProduct',(_name,_description,_product_id,_user,_price,_count))
            data = cursor.fetchall()

            if len(data) is 0:
                conn.commit()
                return json.dumps({'status':'OK'})
            else:
                return json.dumps({'status':'ERROR'})
    except Exception as e:
        return json.dumps({'status':'Unauthorized access'})
    finally:
        cursor.close()
        conn.close()

@app.route('/validateLogin',methods=['POST'])
def validateLogin():
    try:
        _username = request.form['inputEmail']
        _password = request.form['inputPassword']

        # connect to mysql
        con = mysql.connect()
        cursor = con.cursor()
        cursor.callproc('sp_validateLogin',(_username,))
        data = cursor.fetchall()

        if len(data) > 0:
            if check_password_hash(str(data[0][3]),_password):
                session['user'] = data[0][0]
                return redirect('/userHome')
            else:
                return render_template('error.html',error = 'Wrong Email address or Password.')
        else:
            return render_template('error.html',error = 'Wrong Email address or Password.')
            
    except Exception as e:
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        con.close()

@app.route('/signUp',methods=['POST','GET'])
def signUp():
    try:
        _name = request.form['inputName']
        _email = request.form['inputEmail']
        _password = request.form['inputPassword']
        cursor = None

        # validate the received values
        if _name and _email and _password:
            
            # All Good, let's call MySQL       
            conn = mysql.connect()
            cursor = conn.cursor()
            _hashed_password = generate_password_hash(_password)
            cursor.callproc('sp_createUser',(_name,_email,_hashed_password))
            data = cursor.fetchall()

            if len(data) is 0:
                conn.commit()
                return json.dumps({'message':'User created successfully !'})
            else:
                return json.dumps({'error':str(data[0])})
        else:
            return json.dumps({'html':'<span>Enter the required fields</span>'})

    except Exception as e:
        return json.dumps({'error':str(e)})
    finally:
        cursor.close() 
        conn.close()

if __name__ == "__main__":
    app.run(port=5002)
	
def test_answer():
    assert main() != 0
