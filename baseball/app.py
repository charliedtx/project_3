# import necessary libraries
from __future__ import print_function # In python 2.7
import os
from flask import (
    Flask,
    render_template,
    jsonify,
    request,
    redirect)
import sys

app = Flask(__name__)

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import func

app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:///db/baseball.sqlite"
# app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL', '')

db = SQLAlchemy(app)

from .models import People


# create route that renders index.html template
@app.route("/")
def home():
    print('Hello world!', file=sys.stderr)    
    return render_template("index.html")


# create route that returns data for plotting
@app.route("/api/baseball")
def baseball():
    print('baseball!', file=sys.stderr)    
    results = db.session.query(People.birthState, func.count(People.playerID)).group_by(People.birthState).all()
    state = [result[0] for result in results]
    players = [result[1] for result in results]

    trace = {
        "x": state,
        "y": players,
        "type": "bar"
    }

    return jsonify(trace)


if __name__ == "__main__":
    app.run()
