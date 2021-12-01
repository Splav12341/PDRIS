#!flask/bin/python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return "Hello, World 2!"

@app.route('/hi')
def status():
    return "Hello 2"

if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=3001)

