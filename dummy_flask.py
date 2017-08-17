from flask import render_template, Flask
from load_data_into_psql import get_arts

app = Flask(__name__)

@app.route('/')
def hello(name=None):
    arts = get_arts()
    # import ipdb; ipdb.set_trace();
    return render_template('api.html', arts=arts)


if __name__ == '__main__':
    app.run()