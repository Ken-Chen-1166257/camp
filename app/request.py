import os

from app import app, models
from flask import redirect, render_template, request, session, url_for, jsonify, send_from_directory
from flask_bcrypt import Bcrypt
import re
from app.models import *
# Create an instance of the Bcrypt class, which we'll be using to hash user
# passwords during login and registration.
flask_bcrypt = Bcrypt(app)
page_size =6 # 每页显示的记录数



@app.route('/register', methods=['GET', 'POST'])
def register():
        # 获取表单数据
        username = request.form.get('username')
        email = request.form.get('email')
        password = request.form.get('password')
        firstname = request.form.get('firstname')
        lastname = request.form.get('lastname')
        location = request.form.get('location')
        password_hash=flask_bcrypt.generate_password_hash(password) #二·进制密码
        password_hash = password_hash.decode("utf-8")  # 转换字符串插入数据库
        value={
            'username': username,
            'email': email,
            'password_hash': password_hash,
            'first_name': firstname,
            'last_name': lastname,
            'location': location,
            'role':"visitor",
            'status':"active"
        }
        user = User().get("username", username)
        if user:
            return getJsonify(False,"The username already exist",200)
        User().insert(value)
        return getJsonify(True,"Added successfully",200)





@app.route('/signup', methods=['GET', 'POST'])
def signup():
    return render_template('signup.html')




@app.route('/logout', methods=['GET', 'POST'])
def logout():
    session.pop('loggedin', None)
    session.pop('user_id', None)
    session.pop('username', None)
    session.pop('role', None)
    return redirect(url_for('login'))




@app.route('/person', methods=['GET', 'POST'])
def person():
    user_id = session["user_id"]
    user=User().get("user_id",user_id)
    return render_template("home.html",active_page="v2",user=user)






@app.route('/add_issue', methods=['POST'])
def add_issue():
    user_id = session["user_id"]
    data = request.get_json()
    summary = data.get('summary')
    description =data.get('description')
    value = {
        'user_id': user_id,
        'summary': summary,
        'description': description,
        'status': "new"
    }
    Issue().insert(value)
    return getJsonify(True,"Added successfully",200)





@app.route('/edit_image', methods=['GET', 'POST'])
def edit_image():
    user_id = session["user_id"]
    file = request.files['file']
    data = {}
    if file.filename != '':  # 图像文件不为空 编辑成功
        file.save(os.path.join(app.root_path, 'static/images') + "/" + file.filename)
        data['profile_image'] = file.filename
    User().updateWhere("user_id", user_id, data)
    return getJsonify(True,"Image editing successful",200)





@app.route('/edit_person', methods=['GET', 'POST'])
def edit_person():
    user_id = session["user_id"]
    email = request.form['email']
    first_name = request.form['firstName']
    last_name = request.form['lastName']
    location = request.form['location']
    data={}
    data["email"] = email
    data["first_name"] = first_name
    data["last_name"] = last_name
    data["location"] = location
    User().updateWhere("user_id",user_id, data)
    user=User().get("user_id",user_id)
    return render_template("home.html",active_page="v2",user=user,edit_invalid="Edited successfully")



@app.route('/edit_password', methods=['POST'])
def edit_password():
    data = request.get_json()
    user_id=session["user_id"]
    confirm = data.get('confirm')
    p=flask_bcrypt.generate_password_hash(confirm)
    passwordHash=p.decode("utf-8")
    user=User().get("user_id", user_id)
    password_hash = user['password_hash']
    if flask_bcrypt.check_password_hash(password_hash, confirm):
        return getJsonify(False,"The password cannot be the same as before",200)
    values = { 'password_hash': passwordHash }
    User().updateWhere("user_id",user_id, values)
    return getJsonify(True,"Password edited successfully",200)





@app.route('/add_comment', methods=['POST'])
def add_comment():
    user_id = session["user_id"]
    data = request.get_json()
    content = data.get('content')
    issue_id =data.get('issue_id')
    value = {
        'user_id': user_id,
        'content': content,
        'issue_id': issue_id
    }
    Comment().insert(value)
    # 如果不是访问者 将问题状态打开为new
    if session["role"]!="visitor":
        issue=Issue().get("issue_id",issue_id)
        value={
            "status":"new"
        }
        Issue().updateWhere("issue_id",issue_id,value)
    return getJsonify(True,"Add comment successful",200)



def getJsonify(success,message,port):
    response  ={"success": success, "message": message}
    return jsonify(response), port  # 返回成功的消息，HTTP 状态码为 200


@app.route('/change_user_status', methods=['POST'])
def change_user_status():
    # 从请求中获取 JSON 数据
    data = request.get_json()
    user_id = data.get('user_id')
    status = data.get('status')
    values = {
        'status': status
    }
    User().updateWhere("user_id", user_id, values)
    return getJsonify(True,"User status changed successfully",200)




@app.route('/clear_image', methods=['POST'])
def clear_image():
    user_id = session["user_id"]
    value={
        "profile_image":""
    }
    User().updateWhere("user_id", user_id, value)
    return getJsonify(True,"Image cleared successfully",200)




@app.route('/change_user_role', methods=['POST'])
def change_user_role():
    data = request.get_json()
    user_id = data.get('user_id')
    role = data.get('role')
    values = { 'role': role}
    User().updateWhere("user_id", user_id, values)
    return getJsonify(True,"Successfully changing roles",200)



@app.route('/')
def root():
    if 'user_id' in session:
        return redirect(url_for("home"))
    return redirect(url_for("login"))


@app.before_request
def check_user_login():
    path=request.path
    noUserVisit=[ #没有登录  可以访问这些
        "/",
        "/login",
        "/signup",
        "/register",
        "/login_check",
        "/check_username"
    ]
    # 检查是否存在 'user_id' 在 session 中
    if 'user_id' not in session:
        #没有登录  访问可以访问的页面
        if path in noUserVisit: #直接放行
            return
        return redirect(url_for("login"))  # 回到登录页面
    else: #用户存在  返回用户可以访问的页面
        #访问其它任何页面
        return
    #登录  访问所有页面放行
    return





@app.route('/issues_all', methods=['POST', "GET"])
def get_issues_all():
    global    page_size# 每页显示的记录数
    total_records=Issue().getCount(f"")[0]['COUNT(*)']
    current_page, total_pages = getPage(1, total_records)
    offset = (current_page - 1) * page_size# 计算
    w = f" LIMIT {page_size} OFFSET {offset}"  # 使用 OFFSET 值来构建查询
    data = Issue().getPosition(w)
    for item in data:
        item['create_at'] = item['create_at'].isoformat()  # 转换为 ISO 格式字符串
        user=User().get("user_id", item['user_id'])
        item["username"]=user['username']
    return render_template("home.html", issues=data, active_page="v1",current_page=current_page,total_pages=total_pages)


def getPage(current_page,total_records):
    if current_page < 1:
        current_page = 1
    total_pages = (total_records + page_size - 1) // page_size
    if current_page > total_pages:  # 如果总页数不够 设置为第一页
        current_page = 1  # 那就第一页
    return current_page,total_pages




@app.route('/search_issue', methods=['GET', 'POST'])
def search_issue():
    global  page_size
    current_page = int(request.form.get('current_page'))  # 获取第一个 POST 参数
    key = request.form.get('statusSelect')  # 获取第三个 POST 参数
    if key=="all":
        total_records = Issue().getCount(f"")[0]['COUNT(*)']
    elif key=="resolved":
        total_records = Issue().getCountWhere(f" status = 'resolved'")[0]['COUNT(*)']
    else:
        total_records = Issue().getCountWhere(f" status != 'resolved'")[0]['COUNT(*)']
    if total_records == 0: #如果没有数据 直接返回
        return render_template("home.html", issues=[], current_page=0, status_select=key,  active_page="v1", total_pages=0)
    current_page,total_pages = getPage(current_page,total_records)
    offset = (current_page - 1) * page_size  # 计算 OFFSET
    w = f" LIMIT {page_size} OFFSET {offset}"  # 使用 OFFSET 值来构建查询
    if key=="all":
        issues = Issue().getPosition(w)
    elif key=="resolved":
        issues = Issue().getWhereByLimit(" status = 'resolved'", w)
    else:
        issues = Issue().getWhereByLimit(" status != 'resolved'", w)
    for item in issues:
        item['create_at'] = item['create_at'].isoformat()  # 转换为 ISO 格式字符串
        user = User().get("user_id", item['user_id'])
        item["username"] = user['username']
    return render_template("home.html", issues=issues, current_page=current_page,status_select=key,active_page="v1",  total_pages=total_pages)




@app.route('/change_status', methods=['POST'])
def change_status():
    data = request.get_json()    # 从请求中获取 JSON 数据
    issue_id = data.get('issue_id')
    status = data.get('status')
    values = { 'status': status}
    Issue().updateWhere("issue_id", issue_id, values)     # 假设密码更改成功
    return  getJsonify(True,"The username already exists",200)



@app.route('/search_user', methods=['GET', 'POST'])
def search_user():
    global  page_size
    current_page = int(request.form.get('currentPage'))  # 获取第一个 POST 参数
    value = request.form.get('userInput')  # 获取第二个 POST 参数
    key = request.form.get('selectedText')  # 获取第三个 POST 参数
    if value=="":
        total_records=User().getCount(f"")[0]['COUNT(*)']
    else:
        total_records = User().getContainCount(key,value)[0]['COUNT(*)']
    if total_records == 0: #如果没有数据 直接返回
        return render_template('home.html', users=[],  selectedText=key,userInput=value,active_page="v3", current_page=0, total_pages=0)
    current_page,total_pages = getPage(current_page,total_records)
    offset = (current_page - 1) * page_size  # 计算 OFFSET
    w = f" LIMIT {page_size} OFFSET {offset}"  # 使用 OFFSET 值来构建查询
    if value == "":
        users=User().getPosition(w)
    else:
        users = User().getContainPosition(key, value, w)
    return render_template('home.html', users=users, selectedText=key,userInput=value,active_page="v3", current_page=current_page, total_pages=total_pages)






@app.route('/user_management', methods=['GET', 'POST'])
def user_management():
    global    page_size# 每页显示的记录数
    total_records = User().getCount(f"")[0]['COUNT(*)']
    current_page,total_pages = getPage(1,total_records)
    offset = (current_page - 1) * page_size  # 计算 OFFSET
    w = f"LIMIT {page_size} OFFSET {offset}"  # 使用 OFFSET 值来构建查询
    users = User().getPosition(w)
    return render_template('home.html',users=users,active_page="v3",current_page=current_page,total_pages=total_pages)





@app.route('/all_issue_management', methods=['GET', 'POST'])
def all_issue_management():
    global    page_size# 每页显示的记录数
    total_records = Issue().getCount(f"")[0]['COUNT(*)']
    current_page,total_pages = getPage(1,total_records)
    offset = (current_page - 1) * page_size  # 计算 OFFSET
    w = f"LIMIT {page_size} OFFSET {offset}"  # 使用 OFFSET 值来构建查询
    data = Issue().getPosition(w)
    for item in data:    # 转换 datetime 对象为字符串格式，以便 JSON 序列化
        item['create_at'] = item['create_at'].isoformat()  # 转换为 ISO 格式字符串
    return render_template("home.html",issues=data,active_page="v1",current_page=current_page,total_pages=total_pages)





@app.route('/home', methods=['GET', 'POST'])
def home():

    global page_size  # 每页显示的记录数
    total_records = Issue().getCount(f"")[0]['COUNT(*)']
    current_page,total_pages = getPage(1,total_records)
    offset = (current_page - 1) * page_size  # 计算 OFFSET
    w = f" LIMIT {page_size} OFFSET {offset}"  # 使用 OFFSET 值来构建查询
    data = Issue().getPosition(w)
    for item in data:  # 转换 datetime 对象为字符串格式，以便 JSON 序列化
        item['create_at'] = item['create_at'].isoformat()  # 转换为 ISO 格式字符串
        user = User().get("user_id", item["user_id"])
        item["username"] = user["username"]
    return render_template('home.html', issues=data, active_page="v1", current_page=current_page,total_pages=total_pages)







@app.route('/login', methods=['GET', 'POST'])
def login():
    return render_template('login.html')

# todo 密码获取
# $2b$12$PX0kb.HJW52OHys/Adb3MODFUICAHevNoY83582Zh1U8aSmdRVMa2   123456aaa
# input="123456aaa"#输入密码
#   password_hash=flask_bcrypt.generate_password_hash(input) #二·进制密码
#   h=flask_bcrypt.check_password_hash(password_hash, input) #密码匹配成功  匹配二进制
#   sql=password_hash.decode("utf-8")  #转换字符串插入数据库
#



@app.route('/login_check', methods=['GET', 'POST'])
def login_check():

    error = {"success": False, "message": "User or password does not exist"}
    success = {"success": True, "message": "Login succeeded"}
    if 'loggedin' in session:
        return jsonify(success), 200
    if request.method=='POST' and 'username' in request.form and 'password' in request.form:
        username = request.form['username']
        user = User().get("username",username)
        if user is not None:
            if user["status"] != "active":
                return jsonify(error), 200
            password = request.form['password']  #输入的密码
            password_hash = user['password_hash']  #数据库密码
            password_hash=flask_bcrypt._unicode_to_bytes(password_hash)
            if flask_bcrypt.check_password_hash(password_hash, password):
                session['loggedin'] = True
                session['user_id'] = user['user_id']
                session['username'] = user['username']
                session['role'] = user['role']
                return jsonify(success), 200
            else:
                return jsonify(error), 200
        else:
            return jsonify(error), 200
    return jsonify(success), 200



@app.route('/get_comment', methods=['GET', 'POST'])
def get_comment():
    data = request.get_json()
    issue_id = data.get('issue_id')  # 获取请求体中的 issue_id
    w=f"issue_id={issue_id}" #获取信息
    comments = Comment().getWhere(w) #获取所有评论
    for item in comments:    # 转换 datetime 对象为字符串格式，以便 JSON 序列化
        item['create_at'] = item['create_at'].isoformat()  # 转换为 ISO 格式字符串
        user_id = item['user_id']
        user = User().get("user_id", user_id)
        item["username"] = user["username"]
        item["role"] = user["role"]
        item["profile_image"] = user["profile_image"]
    return  getJsonify(True,comments,200)


@app.route('/check_username', methods=['POST'])
def check_username():
    data = request.get_json()  # 获取前端传来的 JSON 数据
    username = data.get('username')
    user=User().get("username", username)
    if user is None:
        return jsonify({}), 200 #不存在返回true
    return jsonify({}), 400 #存在返回false


