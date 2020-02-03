from flask import Flask

app = Flask(__name__)


@app.route('/')
def index():
    return "Hello"


@app.route('/flag')
def flag():
    flag = ''
    with open('/flag', 'r') as f:
        flag = f.read()
    return flag


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
