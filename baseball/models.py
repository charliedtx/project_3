from .app import db


class People(db.Model):
    __tablename__ = 'people'
    playerID = db.Column(db.Integer, primary_key = True)	
    birthYear = db.Column(db.Integer)
    birthMonth = db.Column(db.Integer)
    birthDay = db.Column(db.Integer)	
    birthCountry = db.Column(db.String(64))
    birthState = db.Column(db.String(2))
    birthCity = db.Column(db.String(64))
    deathYear = db.Column(db.Integer)
    deathMonth = db.Column(db.Integer)	
    deathDay= db.Column(db.Integer)	
    deathCountry = db.Column(db.String(64))
    deathState = db.Column(db.String(2))
    deathCity = db.Column(db.String(64))
    nameFirst = db.Column(db.String(64))
    nameLast = db.Column(db.String(64))	
    nameGiven = db.Column(db.String(64))	
    weight = db.Column(db.Integer)	
    height= db.Column(db.Integer)
    bats = db.Column(db.String(1))	
    throws = db.Column(db.String(1))
    debut = db.Column (db.Date)
    finalGame = db.Column (db.Date)
    retroID	= db.Column (db.Integer)
    bbrefID = db.Column (db.Integer)

    def __repr__(self):
        return '<People %r>' % (self.name)
