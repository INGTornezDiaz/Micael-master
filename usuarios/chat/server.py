import win32com.client
from flask import Flask, render_template, request
from flask_socketio import SocketIO, send, emit

app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
socketio = SocketIO(app, cors_allowed_origins="*")

users = {}

@app.route('/')
def index():
    return render_template('index.html')  

@app.route('/chat')
def chat():
    username = request.args.get('username')
    role = request.args.get('role')
    return render_template('chat.html', username=username, role=role)

@socketio.on('join')
def handle_join(data):
    username = data['username']
    role = data['role']
    users[request.sid] = {'username': username, 'role': role}
    # Envía un mensaje estructurado al cliente
    emit('message', {'message': f"{username} ({role}) se ha unido al chat.", 'sender': 'system'}, broadcast=True)

@socketio.on('message')
def handle_message(data):
    user = users.get(request.sid, {'username': 'Desconocido', 'role': 'Usuario'})
    username = user['username']
    role = user['role']
    print(f"[{role}] {username}: {data}")
    # Envía un objeto estructurado al cliente
    send({'message': data, 'sender': role}, broadcast=True)

@socketio.on('disconnect')
def handle_disconnect():
    user = users.pop(request.sid, None)
    if user:
        emit('message', {'message': f"{user['username']} ({user['role']}) ha salido del chat.", 'sender': 'system'}, broadcast=True)

if __name__ == '__main__':
    socketio.run(app, host='0.0.0.0', port=5000, debug=True)
