from app import db


class Attribute:
    def __init__(self, name):
        self.name = name
        self.value = None
class SqlOperation:
    table=""
    def updateWhere(self, key, key_value, values):
        # 将更新字段和占位符组合在一起
        set_clause = ', '.join([f"{field} = %s" for field in values.keys()])
        # 构造 SQL 语句
        sql = f'''
                UPDATE {self.table}
                SET {set_clause}
                WHERE {key} = %s;
                '''
        # 在 values 后面添加 key_value 作为最后一个参数
        with db.get_cursor() as cursor:
            cursor.execute(sql, tuple(values.values()) + (key_value,))
    def getValueList(self):
        valueList = []
        for attribute_name in dir(self):
            if not attribute_name.startswith('__'):  # Exclude special methods
                attribute = getattr(self, attribute_name)
                if isinstance(attribute, Attribute):  # Check if the attribute is of type 'Attribute'
                    valueList.append(attribute)
        return valueList
    def getAttribute(self):
        valueList =self.getValueList()
        h = ""
        for i in range(len(valueList)):
            h += f'{valueList[i].name},'
        h = h[:-1]  # 去掉最后一个字符
        return h
    def insert(self,values):
        # 插入代码如上所示
        columns = ', '.join(values.keys())
        placeholders = ', '.join(['%s'] * len(values))
        sql = f'''
                  INSERT INTO {self.table} ({columns})
                  VALUES ({placeholders});
              '''
        with db.get_cursor() as cursor:
            cursor.execute(sql, tuple(values.values()))

    def get(self, key, value):
        with db.get_cursor() as cursor:
            cursor.execute(f'''
                  SELECT {self.getAttribute()}
                  FROM {self.table}
                  WHERE {key} = %s;
              ''', (value,))  # 使用 value 参数化查询
            account = cursor.fetchone()
        return account
    def getWhere(self,position):
        with db.get_cursor() as cursor:
            cursor.execute(f'''
                       SELECT {self.getAttribute()}
                        FROM {self.table}
                       WHERE {position}; ''')
            account = cursor.fetchall()
        return account

    def getWhereByLimit(self, position,limit):
        with db.get_cursor() as cursor:
            cursor.execute(f'''
                        SELECT {self.getAttribute()}
                         FROM {self.table}
                        WHERE {position}  {limit}; ''')
            account = cursor.fetchall()
        return account

    def getPosition(self,position):
        with db.get_cursor() as cursor:
            cursor.execute(f'''
                       SELECT {self.getAttribute()}
                        FROM {self.table}
                         {position}; ''')
            account = cursor.fetchall()
        return account

    def getAll(self):
        with db.get_cursor() as cursor:
            cursor.execute(f'''
                          SELECT {self.getAttribute()}
                           FROM {self.table}; ''')
            account = cursor.fetchall()
        return account

    def getContainCount(self,key,value):
        with db.get_cursor() as cursor:
            cursor.execute(f'''
                      SELECT COUNT(*)
                      FROM {self.table}
                      WHERE {key} LIKE %s;
                  ''', (f'%{value}%',))  # 使用 LIKE 和通配符来模糊匹配
            count = cursor.fetchall() # 只取第一行第一列的结果
        return count

    def getContainPosition(self, key, value, position):
        with db.get_cursor() as cursor:
            cursor.execute(f'''
                               SELECT *
                               FROM {self.table}
                               WHERE {key} LIKE %s 
                               {position};
                           ''', (f'%{value}%',))  # 使用 LIKE 和通配符来模糊匹配
            count = cursor.fetchall()  # 只取第一行第一列的结果
        return count
    def getCount(self, situation):
        with db.get_cursor() as cursor:
            cursor.execute(f'''
                          SELECT COUNT(*)
                           FROM {self.table}
                           {situation}; ''')
            count = cursor.fetchall()
        return count

    def getCountWhere(self, situation):
        with db.get_cursor() as cursor:
            cursor.execute(f'''
                            SELECT COUNT(*)
                             FROM {self.table}
                             where {situation}; ''')
            count = cursor.fetchall()
        return count
