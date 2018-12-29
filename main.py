from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

app = Flask(__name__)
app.secret_key = 'super-secret-key'

#use mysql using xamp
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/theprogrammer'
db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)


# admin_user and admin_password variable use for Admin login
admin_user = "admin"
admin_password = "password"


@app.route("/")
def home():
    posts = Posts.query.filter_by().all()#[0:3]
    return render_template('index.html', posts=posts)

@app.route("/about")
def about():
    return render_template('about.html')

@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', post=post)

@app.route("/edit/<string:sno>", methods = ['GET', 'POST'])
def edit(sno):
    if ('user' in session and session['user'] == admin_user):
        if request.method== 'POST':
            box_title = request.form.get('title')
            slug = request.form.get('slug')
            content = request.form.get('content')
            date = datetime.now()

            if sno=='0':
                post = Posts(title=box_title, slug=slug, content=content, date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post =Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.slug = slug
                post.content = content
                post.date = date
                db.session.commit()
                return redirect('/edit/'+sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', post=post, sno=sno)

@app.route("/delete/<string:sno>", methods = ['GET', 'POST'])
def delete(sno):
    if('user' in session and session['user']== admin_user):
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('dashboard')



@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if (request.method == 'POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, phone_num=phone, msg=message, date = datetime.now(), email=email)
        db.session.add(entry)
        db.session.commit()
    return render_template('contact.html')


@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():

    if('user' in session and session['user'] == admin_user):
        posts = Posts.query.all()
        return render_template('dashboard.html', posts=posts)

    if request.method =='POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if(username == admin_user and userpass ==admin_password):
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', posts = posts)
    return render_template('login.html')

app.run(debug=True)