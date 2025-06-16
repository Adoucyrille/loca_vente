
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'locatvente',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': '127.0.0.1',
        'PORT': '3306',
        'OPTIONS': {
            'unix_socket': '/tmp/mysql.sock',
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
        },
    }
}