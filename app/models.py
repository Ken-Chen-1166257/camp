
from app.sqlTool import *

class  User(SqlOperation):
    table = "users"
    user_id = Attribute("user_id")
    username = Attribute("username")
    password_hash = Attribute("password_hash")
    email = Attribute("email")
    first_name = Attribute("first_name")
    last_name = Attribute("last_name")
    location_name = Attribute("location")
    profile_image = Attribute("profile_image")
    status = Attribute("status")
    role=Attribute("role")
    def __init__(self):
        pass


    def update(self, id, values):
        set_clause = ', '.join([f"{key} = %s" for key in values.keys()])
        sql = f'''
                    UPDATE {self.table}
                    SET {set_clause}
                    WHERE user_id = %s;
                '''
        with db.get_cursor() as cursor:
            cursor.execute(sql, tuple(values.values()) + (id,))


class Issue(SqlOperation):
    table = "issues"
    issue_id = Attribute("issue_id")
    user_id = Attribute("user_id")
    summary = Attribute("summary")
    description = Attribute("description")
    create_at = Attribute("create_at")
    status = Attribute("status")

    def __init__(self):
        pass
class Comment(SqlOperation):
    table = "comments"
    issue_id = Attribute("comment_id")
    user_id = Attribute("issue_id")
    summary = Attribute("user_id")
    description = Attribute("content")
    create_at = Attribute("create_at")

    def __init__(self):
        pass