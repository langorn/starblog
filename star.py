import json,os
import bottle
from bottle import Bottle
from bottle import template
from bottle import route, run, request, abort, view
from pymongo import Connection


from bottle import static_file
from bson import Binary, Code
from bson.json_util import dumps
from bson.json_util import loads
from bson.objectid import ObjectId

# beaker session
from beaker.middleware import SessionMiddleware
import md5,urllib2
import feedparser


session_opts = {
    'session.type': 'file',
    'session.cookie_expires': 300,
    'session.data_dir': './data',
    'session.auto': True
    #'key':'timercount',
    #'secret':'victorysecret'
}

app = SessionMiddleware(bottle.app(), session_opts)
app_session = bottle.request.environ.get('beaker.session')

connection = Connection('localhost',27017)
db = connection.mydatabase
#db = connection['stars']
stardb = db.stars



@bottle.route('/star_detail/<name>',method='GET')
@view('editStar')
def star_detail(name):
	setup_request()
	star = stardb.find_one({'_id':ObjectId(name)})

	allblog = ''
	for b in star['blog']:
		allblog += b+';'
	print star

	star['blog_list'] = allblog
	print star
	return dict(sname=star)


@bottle.route('/star/<name>', method='DELETE')
def delete_star(name):
	setup_request()
	id = name
	stardb.remove({'_id':ObjectId(id)})


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
	occupant = []
	# for ocp in occupanys:
	# 	occupant.append(ocp);
	# print occupant;
	blog_list = []
	blog_split = blogs.split(';')
	print blog_split
	for blog in blog_split:
		blog_list.append(blog)
	print blog_list


	if not data:
		abort(400, 'No data received')
	# stardata = json.loads(data)
	# if not stardata.has_key('_id'):
	# 	abort(400, 'no id ')
	# try:
	stardb.update({'_id':ObjectId(_id)},{'$set':{'name':name,'surname':surname,
	'blog':blog_list,'fb':fb, 'gender':gender, 'occupant':occupant}},upsert=False)
	# except:
	# 	abort(400,str(ve))


@bottle.route('/update_blog', method='PUT')
def update_blog():
	setup_request()
	url = bottle.request.POST.get('urls')
	id = bottle.request.POST.get('id')
	d = feedparser.parse(url)
	print d.feed.title
	#print dict(title=d.feed.title)
	title = d.feed.title
	link = d.feed.link

	#print d.entries[0].summary_detail.value
	print d.entries[0]
	#print d.entries[0].date
	
	try:
		title = d.entries[0].title_detail.value
	except:
		title = ''

	try:
		link = d.entries[0].link
	except:
		link = d.entries[0].link
	
	try: 
		published = d.entries[0].published
	except:
		published = ''

	try:
		pid = d.entries[0].id
	except:
		pid = ''

	data = {'title':title, 'link':link , 'published':published}
	#data = {"title": d.feed.title,"description":d.feed.description,"link":d.feed.link}
	stardb.update({'_id':ObjectId(id)},{'$set':{'lastPost':data}},upsert=False)

	return
	#return dict(data=data)



@bottle.route('/starc', method='GET')
@view('addStar')
def morning_star():
	setup_request()
	title = "New User"
	return dict(name=title)

@bottle.route('/star/<name>', method='GET')
@view('star_template')
def get_star(name):
	star = stardb.find_one({'_id':ObjectId(name)})
	print name
	if not star:
		abort(404,'No document with id %s' % id)
	return dict(name=star['name'])
	#return template('hi dear {{name}}',name=star['name'])
	#return dumps(star)


@bottle.route('/star', method='POST')
def create_star():
	star = request.body.readline()
	star = loads(star)
	print star
	if not star:
		abort(400,"no data")
	
	stardb.insert(star)


@bottle.route('/upload/<name>',method='POST')
def upload_photo(name):

	data = bottle.request.files.get('file')
	fname, ext = os.path.splitext(data.filename)

	#print fname

	upload_dir = os.path.join(os.getcwd(),'static/upload')

	if not os.path.isdir(upload_dir):
		os.mkdir(upload_dir)
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


#basic static file setting 
@bottle.route('/static/js/<filename:path>')
def send_static2(filename):
	return static_file(filename, root = './static/js/')


@bottle.route('/static/css/<filename>')
def send_static(filename):
    return static_file(filename,  root = './static/css/')

@route('/static/template/<filename:path>')
def file_static(filename):
	return static_file(filename, root='./static/template/')

@route('/static/upload/<filename:path>')
def upload_static(filename):
	return static_file(filename, root='./static/upload/')

@bottle.route('/',method = 'GET')
@view('star_index')
def allstars():
	stars = db['stars'].find()
	#return stars
	session = bottle.request.environ.get('beaker.session')

	user_roles = 'user_roles' in session
	user_id = 'user_id' in session

	if user_roles:
		print user_roles
	
	if user_id:
		print user_id

	return dict(stars=stars)


@bottle.route('/admin',method = 'GET')
@view('admin_index')
def allstars():
	setup_request()
	stars = db['stars'].find()
	#return stars
	return dict(stars=stars)

@bottle.route('/user/login',method='GET')
@view('login')
def login_pages():
	title = 'login user'
	return dict(name=title)


@bottle.route('/user/new',method='GET')
@view('new_user')
def new_user():
	title = "New User"
	return dict(name=title)


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

#@bottle.hook('before_request')
def setup_request():
	try:
		request.session = bottle.request.environ['beaker.session']
	except:
		abort(401,"Fails")
	try:
		name = request.session['user_roles']
	except:
		bottle.redirect('/user/login')

@bottle.route('/parse_xml',method='POST')
def parse_xml():
	setup_request()
	url = bottle.request.POST.get('urls')
	d = feedparser.parse(url)
	#print d.feed.title
	#print dict(title=d.feed.title)
	try:
		title = d.feed.title
		data = {"title": d.feed.title,"description":d.feed.description,"link":d.feed.link}
		return dict(data=data)
	except:
		return dict(data='')

#run(host='localhost', port=8080)
bottle.run(app=app)
