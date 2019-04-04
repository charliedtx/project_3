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
from .models import Batting
from .models import Salaries
from .models import HomeGames


# create route that renders index.html template
@app.route("/")
def home():
    print('Hello world!', file=sys.stderr)
    return render_template("index.html")


# create route that returns data for plotting
@app.route("/api/people")
def people():
    print('people!', file=sys.stderr)
    results = db.session.query(People.birthState, func.count(People.playerID)).group_by(People.birthState).all()
    state = [result[0] for result in results]
    players = [result[1] for result in results]

    trace = {
        "x": state,
        "y": players,
        "type": "bar"
    }

    return jsonify(trace)

# create route that returns data for plotting
@app.route("/api/batting")
def batting():
    print('batting!', file=sys.stderr)
    results = db.session.query(Batting.yearID, func.sum(Batting.HR)).group_by(Batting.yearID).all()
    print('batting!', file=sys.stderr)

    year = [result[0] for result in results]
    homeruns = [result[1] for result in results]

    trace = {
        "x": year,
        "y": homeruns,
        "type": "bar"
    }

    return jsonify(trace)

@app.route("/api/attendance")
def attendance():
    print('attendance!', file=sys.stderr)
    results = db.session.query(HomeGames.team, func.sum(HomeGames.attendance)).all()
    print('attendance!', file=sys.stderr)

    team = [result[0] for result in results]
    attendance = [result[1] for result in results]

    trace = {
        "x": team,
        "y": attendance,
        "type": "bar"
    }

    return jsonify(trace)

if __name__ == "__main__":
    app.run()
