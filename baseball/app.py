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
    return render_template("index.html")


# create route that returns data for plotting
@app.route("/api/people")
def people():
    results = db.session.query(Salaries.yearID, func.avg(Salaries.salary)).group_by(Salaries.yearID).all()
    state = [result[0] for result in results]
    players = [result[1] for result in results]

    trace = {
        "x": state,
        "y": players,
        "type": "scatter"
    }

    return jsonify(trace)

# create route that returns data for plotting
@app.route("/api/homeruns")
def batting():
    results = db.session.query(Batting.yearID, func.sum(Batting.HR)).group_by(Batting.yearID).all()
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
    results = db.session.query(HomeGames.year, func.sum(HomeGames.attendance)).filter(HomeGames.year > 1969).group_by(HomeGames.year).all()
    year = [result[0] for result in results]
    attendance = [result[1] for result in results]

    trace = {
        "x": year,
        "y": attendance,
        "type": "line"
    }

    return jsonify(trace)

@app.route("/api/salaries")
def salaries():
    results = db.session.query(Salaries.yearID, func.avg(Salaries.salary)).filter(Salaries.yearID > 1985).group_by(Salaries.yearID).all()
    yearID = [result[0] for result in results]
    salary = [result[1] for result in results]

    trace = {
        "x": yearID,
        "y": salary,
        "type": "bar"
    }

    return jsonify(trace)

if __name__ == "__main__":
    app.run()
