import datetime
#from colorama import Cursor
from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors


app = Flask(__name__)
app.secret_key = 'your secret key'
#setup bbdd local
#app.config['MYSQL_HOST'] = 'localhost'
#app.config['MYSQL_USER'] = 'root'
#app.config['MYSQL_PASSWORD'] = ''
#app.config['MYSQL_DB'] = 'pythonlogin'

#setup bbdd pythonanywhere
app.config['MYSQL_HOST'] = 'leonorperez.mysql.pythonanywhere-services.com'
app.config['MYSQL_USER'] = 'leonorperez'
app.config['MYSQL_PASSWORD'] = 'lascano4044'
app.config['MYSQL_DB'] = 'leonorperez$pythonlogin'

user = {}
mysql = MySQL(app)

def refreshList() :
    global user
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM accounts WHERE id = %s', (user['id'],))
    user = cursor.fetchone()



@app.route('/', methods = ['GET', 'POST'])
def login():
    global user
    error = ''
    
    if request.method == 'POST':
        usuario = request.form['usuario']
        password = request.form['password']
        
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM accounts WHERE usuario = %s AND password = %s', (usuario, password,))
        user = cursor.fetchone()

        if user:
            session['loggedin'] = True
            return redirect(url_for('home'))       
        else:  
            error = '¡Usuario/contraseña Incorrecto!'
    return render_template('index.html', error = error)
   

@app.route('/logout')
def logout():
    global user
    session.pop('loggedin', None)
    session.pop('id', None)
    session.pop('usuario', None)
    user = {}
    return redirect(url_for('login'))

@app.route('/home/edit', methods=['GET', 'POST'])
def edit():
    global user
    if len(user) == 0:
        return redirect(url_for('login'))
    elif request.method == 'POST':
        password = request.form['password']
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        localidad = request.form['localidad']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute("""
            UPDATE accounts
            SET nombre = %s,
                apellido = %s,
                localidad = %s,
                password = %s
            WHERE id = %s
        """, (nombre, apellido, localidad, password, user['id'],))
        mysql.connection.commit()
        refreshList()
        return redirect(url_for('home'))
    return render_template('edit.html', user = user)

@app.route('/register', methods=['GET', 'POST'])
def register():
    error = ''
   
    if request.method == 'POST':
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        localidad = request.form['localidad']
        usuario = request.form['usuario']
        password = request.form['password']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM accounts WHERE usuario = %s', (usuario,))
        account = cursor.fetchone()
        
        if account:
            error = '¡El usuario ya existe!'
        else:                     
            cursor.execute('INSERT INTO accounts VALUES (NULL, %s, %s, %s, %s, %s)', (nombre, apellido, localidad, usuario, password,))
            mysql.connection.commit()
            msg = '¡Usuario registrado correctamente!'
            return render_template('index.html', msg = msg)
    return render_template('register.html', error = error)


@app.route('/publicacion', methods=['GET', 'POST'])
def publicacion():    
    
    if request.method == 'POST':

        global user 
        tipoPublicacion = request.form['tipoPublicacion']
        tipoMascota = request.form['tipoMascota']
        nombreMascota = request.form['nombreMascota']
        color = request.form['color']
        edad = request.form['edad']
        sexo = request.form['sexo']
        ubicacion = request.form['ubicacion']
        calle = request.form['calle']
        foto = request.form['foto']
        fecha = request.form['fecha']
        mensaje = request.form['mensaje']
        idUsuario = user['id']             
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)      
                     
        
        cursor.execute('INSERT INTO publicacion VALUES (NULL, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)', (idUsuario,tipoPublicacion, tipoMascota, nombreMascota, color, edad, sexo, ubicacion,calle, foto, fecha, mensaje))
        mysql.connection.commit()
        msg = 'Publicación registrada correctamente!'
        return render_template('publicacion.html', msg = msg)
        
    fecha = datetime.datetime.now()
    return render_template('publicacion.html', fecha = fecha)
    
   

@app.route('/home')
def home():
    global user
    if 'loggedin' in session:
        return render_template('home.html', nombre = user['nombre'], apellido = user['apellido'])
    return redirect(url_for('login'))  


if __name__ == "__main__":
    app.run(port=3307, debug=True);


    