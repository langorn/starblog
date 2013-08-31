import json,os
import bottle
from bottle import Bottle
from bottle import template
from bottle import route, run, request, abort, view
from pymongo import Connection


from bottle import static_file

#call json
from bson import Binary, Code
from bson.json_util import dumps
from bson.json_util import loads
from bson.objectid import ObjectId



#verify in LOCAL or SERVER


# beaker session
from beaker.middleware import SessionMiddleware
import md5,urllib2
import feedparser
import socket



session_opts = {
    'session.type': 'file',
    'session.cookie_expires': 30000,
    'session.data_dir': './data',
    'session.auto': True
    #'key':'timercount',
    #'secret':'victorysecret'
}

host = socket.gethostbyname(socket.gethostname())

app = bottle.default_app()

if host=='127.0.1.1':
	WEB_PATH = os.environ.get('SERVER_NAME')
	WEB_STATIC =''
	webroot = './static'
	webpath = template('views/'+'banner')
	app.config.setdefault('webpath',webpath)

else:
#SERVER STATIC FILES
	WEB_PATH = os.environ.get('SERVER_NAME')
	WEB_STATIC = '/home/hanchakra/webapps/starblogstatic/views/'
	webroot = 'home/hanchakra/webapps/starblogstatic/static'
	webpath = template(WEB_STATIC+'banner')
	app.config.setdefault('webpath',webpath)



application = SessionMiddleware(app, session_opts)
app_session = bottle.request.environ.get('beaker.session')

connection = Connection('localhost',27017)
db = connection.mydatabase
#db = connection['stars']
stardb = db.stars



#CREATE STAR
@bottle.route('/star_detail/<name>',method='GET')
@view(WEB_STATIC+'editStar')
def star_detail(name):
	setup_request()
	star = stardb.find_one({'_id':ObjectId(name)})

	allblog = ''
	countLoop = 1

	if len(star['blog']) > 1:
		for b in star['blog']:
			if countLoop != len(star['blog']):
				allblog += b+';'
			else:
				allblog += b
			countLoop = countLoop+1

		print star
	else:
		print 'one and one only'
		allblog = star['blog']	

	star['blog_list'] = allblog

	if star.get('country'):
		print star['country']
	else:
		print 'none country'

	webpath = app.config.get('webpath')
	return dict(sname=star,webpath=webpath)

@bottle.route('/star_info/<name>', method='GET')
@view(WEB_STATIC+'star_info')
def star_info(name):

	id = name
	starx = stardb.find_one({'_id':ObjectId(name)})
	chosen = starx['blog'][0]
	print chosen
	d = feedparser.parse('http://'+chosen)

	stars = [] 
	i = 0
	for e in d.entries:
		s = {}
		print e.description
		s['link'] = e.link
		s['title'] = e.title
		s['description'] = e.description
		stars.append(s)
	webpath = app.config.get('webpath')
	return dict(stars=stars,starx=starx,webpath=webpath)

@bottle.route('/star', method='POST')
def create_star():
	star = request.body.readline()
	star = loads(star)
	
	if not star:
		abort(400,"no data")
	
	stardb.insert(star)


@bottle.route('/upload/<name>',method='POST')
def upload_photo(name):

	data = bottle.request.files.get('file')
	fname, ext = os.path.splitext(data.filename)

	#print fname

	upload_dir = os.path.join(os.getcwd(),'static/upload')

	if host == '127.0.1.1':
		upload_dir = os.path.join(os.getcwd(),'static/upload')
	else:
		upload_dir = 'home/hanchakra/webapps/starblogstatic/upload'

	# if not os.path.isdir(upload_dir):
	# 	os.mkdir(upload_dir)
	print os.path.join(upload_dir+'/'+name+ext)	

	try:
		destination = open(upload_dir+'/'+name+ext, 'w+') #.write(data.file.read())
		destination.write(data.file.read())
		full_dir = name+ext
		stardb.update({'_id':ObjectId(name)},{'$set':{'image':full_dir}},upsert=False)
	except Exception as inst:
		print 'fail'
		pass


	bottle.redirect('/star_detail/'+name)

#READ
@bottle.route('/',method = 'GET')
@view(WEB_STATIC+'star_index')
def allstars():
	stars = db['stars'].find().sort('published') 
	#return stars
	session = bottle.request.environ.get('beaker.session')


	user_roles = 'user_roles' in session
	user_id = 'user_id' in session

	if user_roles:
		print user_roles
	
	if user_id:
		print user_id

	webpath = app.config.get('webpath')
	return dict(stars=stars,webpath=webpath)

	#ADMIN BACKEND 
@bottle.route('/admin',method = 'GET')
@view(WEB_STATIC+'admin_index')
def allstars():
	setup_request()
	stars = db['stars'].find().limit(10)
	stars_count = db['stars'].count()
	pages = stars_count/10
	if pages == 0:
		pages = 1
	else:
		if stars_count%10 != 0:
			pages += 1

	total_pages =''
	for i in range(0,pages):
		i = i + 1
		total_pages += '<li><a href="/admin/'+str(i)+'">'+str(i)+'</a></li>'

	#return stars
	webpath = app.config.get('webpath')
	return dict(stars=stars,pages=pages,total_pages=total_pages,webpath=webpath)


@bottle.route('/admin/<id:int>',method = 'GET')
@view(WEB_STATIC+'admin_index')
def star_pagination(id):
	setup_request()
	offset = (id-1) * 10
	stars = db['stars'].find().skip(offset).limit(10)
	stars_count = db['stars'].count()

	pages = stars_count/10
	if pages == 0:
		pages = 1
	else:
		if stars_count%10 != 0:
			pages += 1

	total_pages =''
	for i in range(0,pages):
		i = i + 1
		total_pages += '<li><a href="/admin/'+str(i)+'">'+str(i)+'</a></li>'

	return dict(stars=stars,pages=pages,total_pages=total_pages)

@bottle.route('/category/<name>',method='GET')
@view(WEB_STATIC+'country_category')
def country_category(name):
	stars = stardb.find({'country':name})
	webpath = app.config.get('webpath')
	return dict(stars=stars,webpath=webpath)


@bottle.route('/starc', method='GET')
@view(WEB_STATIC+'addStar')
def morning_star():
	setup_request()
	title = "New User"
	webpath = app.config.get('webpath')
	return dict(name=title,webpath=webpath)

@bottle.route('/star/<name>', method='GET')
@view(WEB_STATIC+'star_template')
def get_star(name):
	star = stardb.find_one({'_id':ObjectId(name)})
	print name
	if not star:
		abort(404,'No document with id %s' % id)
	webpath = app.config.get('webpath')
	return dict(name=star['name'],webpath=webpath)


#UPDATE
@bottle.route('/star', method='PUT')
def add_star():
	data = request.body.readline()
	_id = request.params.get('_id')
	name = request.params.get('name')
	surname = request.params.get('surname')
	blogs = request.params.get('blog')
	fb = request.params.get('fb')
	gender = request.params.get('gender')
	occupanys = request.params.get('occupation')
	country = request.params.get('country')
	occupant = []

	blog_list = []
	blog_split = blogs.split(';')
	print blog_split
	for blog in blog_split:
		blog_list.append(blog)
	print blog_list


	if not data:
		abort(400, 'No data received')

	try:
		stardb.update({'_id':ObjectId(_id)},{'$set':{'name':name,'surname':surname,
		'blog':blog_list,'fb':fb, 'gender':gender, 'occupant':occupant, 'country':country}},upsert=False)
	except:
		abort(400,str(ve))



@bottle.route('/update_blog', method='PUT')
def update_blog():
	setup_request()
	url = bottle.request.POST.get('urls')
	id = bottle.request.POST.get('id')
	d = feedparser.parse('http://'+url)
	d.entries[0].title
	try:

		title = d.feed.title
		title = d.entries[0].title_detail.value
	except:
		title = ''

	try:
		link = d.feed.link
		link = d.entries[0].link
	except:
		link = ''
	
	try: 
		published = d.entries[0].published
	except:
		published = ''

	try:
		pid = d.entries[0].id
	except:
		pid = ''


	try:
		description = d.entries[0].description
	except:
		description = ''

	data = {'title':title, 'link':link , 'published':published , 'description':description}
	#data = {"title": d.feed.title,"description":d.feed.description,"link":d.feed.link}
	stardb.update({'_id':ObjectId(id)},{'$set':{'lastPost':data}},upsert=False)

	return


#DELETE 
@bottle.route('/star/<name>', method='DELETE')
def delete_star(name):
	setup_request()
	id = name
	stardb.remove({'_id':ObjectId(id)})









#basic static file setting 
@bottle.route('/static/js/<filename:path>')
def send_static2(filename):
	#return static_file(filename, root = './static/js/')
	return static_file(filename, root= webroot+'/js/')

@bottle.route('/static/css/<filename>')
def send_static(filename):
    #return static_file(filename,  root = './static/css/')
	return static_file(filename, root= webroot+'/css/')

@route('/static/template/<filename:path>')
def file_static(filename):
	#return static_file(filename, root='./static/template/')
	return static_file(filename, root= webroot+'/template/')

@route('/static/upload/<filename:path>')
def upload_static(filename):
	return static_file(filename, root='./static/upload/')
	return static_file(filename, root= webroot+'/upload/')









#Authenication
@bottle.route('/user/new',method='GET')
@view(WEB_STATIC+'new_user')
def new_user():
	title = "New User"
	webpath = app.config.get('webpath')
	return dict(name=title,webpath=webpath)

@bottle.route('/user/login',method='GET')
@view(WEB_STATIC+'login')
def login_pages():
	title = 'login user'
	webpath = app.config.get('webpath')
	return dict(name=title,webpath=webpath)


@bottle.route('/user',method='POST')
def register():

	username = request.forms.get('username')
	password = request.forms.get('password')

	if username and password:
		print username + password
		user = db['user'].find_one({'username':username})
		if not user:
			hash = md5.new()
			hash.update(password)
			save_password = hash.hexdigest()
			db['user'].insert({'username':username,'password':save_password})
			return
		else:
			print 'User exists!'


	return



@bottle.route('/login_auth',method='POST')
def login_auth():
	username = request.forms.get('username')
	password = request.forms.get('password')
	hash = md5.new()
	hash.update(password)
	password_md5 = hash.hexdigest()

	user = db['user'].find_one({'username':username})
	print user
	if user['password'] == password_md5:
		session = bottle.request.environ.get('beaker.session')
		session['user_roles']= 'user'
		session['user_id'] = user['_id']
		session.save()
		bottle.redirect('/admin')
	else:
		bottle.redirect('/user/login')
		

@bottle.route('/logout',method='GET')
def logout():
	session = bottle.request.environ.get('beaker.session')
	session.delete()
	bottle.redirect('/')

def setup_request():
	try:
		request.session = bottle.request.environ['beaker.session']
	except:
		abort(401,"Fails")
	try:
		name = request.session['user_roles']
	except:
		bottle.redirect('/user/login')


# MODULES FEED_PARSER
@bottle.route('/parse_xml',method='POST')
def parse_xml():
	setup_request()
	url = bottle.request.POST.get('urls')
	d = feedparser.parse(url)

	try:
		title = d.feed.title
		data = {"title": d.feed.title,"description":d.feed.description,"link":d.feed.link}
		return dict(data=data)
	except:
		return dict(data='')

#run(host='localhost', port=8080)
#bottle.run(app=app,reloader=True)
bottle.run(app=application,reloader=True)