# -*- coding:utf-8 -*-
#!/usr/bin/env python
#
# Author: promisejohn
# Email: promise.john@gmail.com
#
from flask import Flask

app = Flask(__name__)
token = "rukidding"

@app.route('/wx/hello')
def index():
	return '<h1>Hello World from flask!</h1>'

@app.route('/wx')
def check_signature(signature, timestamp, nonce):
	L = [timestamp, nonce, token]
	L.sort()
	s = L[0] + L[1] + L[2]
	return hashlib.sha1(s).hexdigest() == signature

@app.route('/wx/user/<username>')
def show_user_profile(username):
	# show the user profile for that user
	return 'User %s' % username

@app.route('/wx/post/<int:post_id>')
def show_post(post_id):
    # show the post with the given id, the id is an integer
	return 'Post %d' % post_id

	
if __name__ == '__main__':
	app.run(debug=True)
