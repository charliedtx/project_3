from .app import db

class People(db.Model):
    __tablename__ = 'people'
    playerID = db.Column(db.String, primary_key = True)	
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

class Batting(db.Model):
    __tablename__ = 'batting'
    playerID = db.Column(db.String, primary_key=True)	
    yearID = db.Column(db.Integer)
    stint = db.Column(db.Integer)
    teamID = db.Column(db.String(4))	
    lgID = 	db.Column(db.String(2))
    G = db.Column(db.Integer)
    AB = db.Column(db.Integer)
    R = db.Column(db.Integer)
    H = db.Column(db.Integer)
    _2B = db.Column(db.Integer)
    _3B = db.Column(db.Integer)
    HR = db.Column(db.Integer)
    RBI = db.Column(db.Integer)
    SB = db.Column(db.Integer)
    CS = db.Column(db.Integer)	
    BB = db.Column(db.Integer)	
    SO = db.Column(db.Integer)	
    IBB = db.Column(db.Integer)	
    HBP = db.Column(db.Integer)	
    SH = db.Column(db.Integer)	
    SF = db.Column(db.Integer)	
    GIDP = db.Column(db.Integer)

class Salaries(db.Model):
    __tablename__ = 'salaries'
    yearID = db.Column(db.Integer, primary_key=True)	
    teamID = db.Column(db.String(3))
    lgID = db.Column(db.String(2))
    playerID = db.Column(db.String(64),primary_key=True)
    salary = db.Column(db.Integer)

class HomeGames(db.Model):
    __tablename__ = 'home_games'
    year.key = db.Column(db.Integer, primary_key=True)
    league.key = db.Column(db.String(2), primary_key=True)	
    team.key = db.Column(db.String(3), primary_key=True)
    park.key = db.Column(db.String(15), primary_key=True)
    span.first = db.Column (db.Date)
    span.last = db.Column (db.Date)
    games = db.Column(db.Integer)
    openings = db.Column(db.Integer)
    attendance = db.Column(db.Integer)

class Parks(db.Model):
    __tablename__ = 'parks'
    park.key = db.Column(db.String(10), primary_key=True)
    park.name = db.Column(db.String(64))
    park.alias = db.Column(db.String(64))
    city = db.Column(db.String(64))
    state = db.Column(db.String(2))
    country = db.Column(db.String(2))

    def __repr__(self):
        return '<People %r>' % (self.name)
