
import glob
from app import app

alist=glob.glob('static/*')
if __name__ == "__main__":
    app.run(host="0.0.0.0",debug=True)
    # app.run(host="127.0.0.1",debug=True)