import re
from datetime import datetime as dt


def foo(match_obj):
    if match_obj.group() is not None:
        x = dt.strptime(match_obj.group(), '%Y%m%d')
        return x.strftime('%d-%b-%Y').upper()


with open('data.sql', 'r+') as file:
    filedata = file.read()
    filedata = re.sub(r'\d{8}', foo, filedata)
    file.write(filedata)
